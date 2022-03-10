class RecipeFoodsController < ActionController::Base
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = @recipe.recipeFoods.create(recipe_params)
    respond_to do |format|
      format.html do
        if recipe_food.save
          flash[:success] = 'Food created successfully'
          redirect_to @recipe
        else
          flash.now[:error] = 'Error: Food could not be created'
          render :new
        end
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

end
