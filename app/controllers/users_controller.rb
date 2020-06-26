class UsersController < ApplicationController
  before_action :correct_user, only: [:mypage]
  skip_before_action :login_required, only: [:index, :new]

  def index
    @users = User.page(params[:page]).per(20).recent
  end

  def show
    @user = User.find(params[:id])
  end

  def mypage
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: "ようこそ！「#{@user.name}」さん！"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to users_url, notice: "更新しました"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url, notice: "退会しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url, alert: "権限がありません" unless current_user.id == @user.id
  end
end
