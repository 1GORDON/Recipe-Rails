class FoodsController < ActionController::Base
  def index; end

  def new
    @food = Food.new
  end
end
