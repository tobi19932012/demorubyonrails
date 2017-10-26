class Frontend::UsersController < Frontend::BaseController
  def index
  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
  end
end
