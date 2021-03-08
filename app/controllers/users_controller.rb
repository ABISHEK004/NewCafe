class UsersController < UserloginController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def index
  end
  
  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/users"
  end
end
#