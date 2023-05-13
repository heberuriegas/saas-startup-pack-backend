class Users::Update < HasuraActionBase
  action_name :users_update

  def run
    super do
      resource = current_user
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
  
      resource_updated = update_resource(resource, account_update_params)
      # yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
  
        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  private

  # By default we want to require a password checks on update.
  # You can overwrite this method in your own RegistrationsController.
  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  def resource_name
    :user
  end

  def translation_scope
    "devise.registrations"
  end

  # Get message for given
  def find_message(kind, options = {})
    options[:scope] ||= translation_scope
    options[:default] = Array(options[:default]).unshift(kind.to_sym)
    options[:resource_name] = resource_name
    I18n.t("#{options[:resource_name]}.#{kind}", **options)
  end

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end


  def set_flash_message_for_update(resource, prev_unconfirmed_email)
    validation_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                  :update_needs_confirmation
                elsif sign_in_after_change_password?
                  :updated
                else
                  :updated_but_not_signed_in
                end
    find_message(kind, options)
  end

  def sign_in_after_change_password?
    return true if account_update_params[:password].blank?

    Devise.sign_in_after_change_password
  end


  def account_update_params
    params
  end
end