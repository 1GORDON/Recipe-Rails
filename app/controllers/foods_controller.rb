class FoodsController < ActionController::Base
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    @food = @user.foods.new
  end

  def create
    @user = User.first
    food = @user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if food.save
          flash[:success] = 'Post created successfully'
          redirect_to foods_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new
        end
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
