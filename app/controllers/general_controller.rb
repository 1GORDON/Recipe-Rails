class GeneralController < ActionController::Base
  def index
    # @foods = Food.includes(:recipeFoods).all.where("user_id != ?", current_user.id)
    @user = current_user
    @recipe = Recipe.where(user_id: @user.id)
    @recipe_foods = RecipeFood.all
    # @food = Food.all
    @foods = Food.where(user_id: @user.id)
  end
end
