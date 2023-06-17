class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.select(:id, :name, :admin)
    @users = @users.page(params[:page]).per(25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザーを登録しました！"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
    @tasks = @user.tasks.by_created_at
    @tasks = @tasks.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました！"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if User.where(admin: true).count <= 1 && @user.admin?
      flash[:danger] = "管理者がいなくなってしまうので、ユーザーを削除できません。"
      redirect_to admin_users_path
    else
      @user.destroy
      flash[:notice] = "ユーザーを削除しました！"
      redirect_to admin_users_path
    end
  end

  private

  def require_admin
    redirect_to tasks_path, flash: { danger: "管理者以外はアクセスできません" } unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
