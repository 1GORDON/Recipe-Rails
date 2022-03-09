class PublicController < ActionController::Base
  def index
    @recipes = Recipe.where(public: true)
  end
end
