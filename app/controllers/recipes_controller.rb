class RecipesController < ActionController::Base
  def index
    @recipess = Recipe.all
  end
end
