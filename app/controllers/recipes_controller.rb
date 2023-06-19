class RecipesController < ApplicationController
    before_action :authorize
  
    def index
      render json: Recipe.all
    end
  
    def create
      recipe = Recipe.create(recipe_params)
      :user_id.recipes << recipe
      render json: recipe, status: :created
    end
  
    private
  
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end

    def authorize
        return render json: { errors: ["not auth", "hi"] }, status: :unauthorized unless session.include? :user_id
    end
  
  end