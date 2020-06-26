class GroupsController < ApplicationController

  def owner
    @user = User.find(params[:id])
    @groups = @user.groups.where(owner_id: @user.id)
  end

  def mygroup
    @group = current_user.groups.find(params[:id])
    @recipes = @group.recipes.all
    @recipes = @group.recipes.page(params[:page]).per(20).recent
  end

  def add_user_group
    group = Group.find(group_params[:id])
    
    if group.password == group_params[:password].to_i
      group.users << current_user
      flash[:notice] = "「#{group.name}」に参加しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "パスワードが違います"
      redirect_back(fallback_location: root_path)
    end
  end

  def remove_user
    group = current_user.groups.find(params[:id])
    group.users.delete(current_user)
    redirect_to recipes_path, notice: "「#{group.name}」を退会しました"
  end

  def show
    @group = Group.find(params[:id])
    @add_group = Group.new
    @member = @group.users.all 
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group), notice: "「#{@group.name}」を作成しました"
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "「#{@group.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
    redirect_to owner_group_path(current_user), notice: "「#{@group.name}」を削除しました"
  end

  private

  def group_params
    params.require(:group).permit(:id, :name, :password, :introduction)
  end
end
