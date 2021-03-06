class UsersessionsController < UserloginController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      # debugger
      redirect_to "/users"
    else
      flash[:error] = "Your login attempt was invalid, Please try again"
      redirect_to "/users"
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/users"
  end
end
#