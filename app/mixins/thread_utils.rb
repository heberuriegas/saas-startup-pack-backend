module ThreadUtils
  def do_with_current_user user
    if user.is_a?(Integer) || user.is_a?(String)
      user = User.find(user)
    end

    Thread.current[:current_user] = user
    begin
      yield
    ensure
      Thread.current[:current_user] = nil
    end      
  end
end