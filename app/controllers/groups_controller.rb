class GroupsController < ApplicationController

  def owner
    @user = User.find(params[:id])
    @groups = @user.groups.where(owner_id: @user.id)
  end

  def show
    @group = Group.find(params[:id])
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
      redirect_to groups_path, notice: "「#{@group.name}」を作成しました"
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
      redirect_to groups_path, notice: "「#{@group.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @groop.destroy
    redirect_to groups_path, notice: "「#{@group.name}」を削除しました"
  end

  private

  def group_params
    params.require(:group).permit(:name, :password, :introduction)
  end
end
