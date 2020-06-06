class UsersController < ApplicationController
  def index
    @users = User.all
    # @groups = Group.where(user_id: current_user.id)
  end

  # def add_user_to_group
  #   @user = User.find(id: current_user.id)
  #   @group = Group.new
  # end

  def show
    @user = User.find(params[:id])
    @recipe = Recipe.find(params[:id])
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
end
