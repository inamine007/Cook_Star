class UsersController < ApplicationController
  before_action :correct_user, only: [:mypage]
  before_action :set_user, only: [:mypage, :show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:index, :new, :create]

  def index
    @users = User.page(params[:page]).per(20).recent
  end

  def show
  end

  def mypage
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, notice: "ようこそ！「#{@user.name}」さん！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to users_url, notice: "更新しました"
  end

  def destroy
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

  def set_user
    @user = User.find(params[:id])
  end
end
