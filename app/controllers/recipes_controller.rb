class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :edit]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      redirect_to 'edit'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
end
