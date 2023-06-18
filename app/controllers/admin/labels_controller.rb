class Admin::LabelsController < ApplicationController
  before_action :require_admin
  before_action :set_label, only: %i[edit update destroy]

  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = "ラベルを作成しました！"
      redirect_to admin_labels_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @label.update(label_params)
      flash[:notice] = "ラベルを編集しました！"
      redirect_to admin_labels_path
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    flash[:notice] = "ラベルを削除しました！"
    redirect_to admin_labels_path
  end

  private

  def require_admin
    redirect_to tasks_path, flash: { danger: "管理者以外はアクセスできません" } unless current_user.admin?
  end

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end
end
