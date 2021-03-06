class UsersController < ApplicationController
  skip_before_action :require_user

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.money = 100
    # @user.user_key = 272537
    # while User.find_by(user_key: @user.user_key) == true
    #   @user.user_key = (100000..999999).to_a.sample
    # end
    @user.user_key = (100000..999999).to_a.sample
    if @user.save
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      flash[:error] = 'Incorrect Email or Password'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name,
                                 :surname, :password_confirmation )
  end
end
