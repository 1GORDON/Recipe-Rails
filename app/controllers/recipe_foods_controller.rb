class RecipeFoodsController < ActionController::Base
    def new
    @user = current_user
    @food = @user.foods.new
    @recipe = @user.recipes.find(params[:recipe_id])
    @recipe_foods = @recipe.recipeFoods.new
    end

    def create
        @user = current_user
        @food = @user.foods.new(food_params)
        @recipe = @user.recipes.find(params[:recipe_id])
        recipe_food = recipeFoods.new(quantity: recipe_params, recipe: @recipe, food: @food)
        respond_to do |format|
          format.html do
            if recipe_food.save
              flash[:success] = 'Food created successfully'
              redirect_to recipe_url
            else
              flash.now[:error] = 'Error: Food could not be created'
              render :new
            end
          end
        end
      end
    
      private
    
      def food_params
        params.require(:food).permit(:name, :measurement_unit, :price)
      end

      def recipe_params
        params.require(:food).permit(:quantity)
      end
end
  