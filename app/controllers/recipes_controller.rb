class RecipesController < ApplicationController
  def index
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
    @recipe = current_user.recipes.find(params[:id])
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :image)
  end

  
end
