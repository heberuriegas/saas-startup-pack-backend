class AddAddUserCurrentPasswordRequiredFnToUser < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      create or replace FUNCTION user_current_password_required(user_row users)
      RETURNS BOOL AS $$
        SELECT user_row.name is not null and user_row.name != '' and user_row.encrypted_password is not null and user_row.encrypted_password != ''
      $$ LANGUAGE sql STABLE;
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION IF EXISTS user_current_password_required(user_row users);
    SQL
  end
end
