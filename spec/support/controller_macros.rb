module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mapping
    sign_in user
  end
end