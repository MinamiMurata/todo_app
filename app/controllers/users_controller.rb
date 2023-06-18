class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

  def new
    redirect_to tasks_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to tasks_path unless current_user.id == @user.id
    @tasks = @user.tasks
    @tasks = @user.tasks.by_created_at
    @tasks = @tasks.page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
