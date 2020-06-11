class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: "「#{@recipe.name}」を登録しました"
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments.all
    @comment = @recipe.comments.build 
  end

  def edit
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to recipes_path, notice: "「#{@recipe.name}」を更新しました"
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "「#{@recipe.name}」を削除しました"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :introduction, images: [])
  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

end
