class RecipesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    recipes = Recipe.all
    render json: {recipes: recipes}
  end

  def create
    json_request = JSON.parse(request.body.read)
    @recipe = Recipe.new(json_request)
    query = {}
    begin
      @recipe.save!
      query[:message] = "Recipe successfully created!"
      query[:recipe] = [json_request]
      render json: query
    rescue
      query[:message] = "Recipe creation failed!"
      query[:required] = "title, making_time, serves, ingredients, cost"
      render json: query
    end
  end

  def new
  end

  def edit
  end

  def show
    recipe = Recipe.find_by_id(params[:id])
    if recipe
      render json: {recipe: [recipe], message: "Recipe details by id"}
    else
      render json: {message: "No Recipe found"}
    end
  end

  def update
    begin
      json_request = JSON.parse(request.body.read)
      Recipe.update(params[:id], json_request)
      render json: {message: "Recipe successfully updated!", recipe: [json_request]}
    rescue
      render json: {message: "No Recipe found"}
    end
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id])
    begin
      recipe.destroy
      render json: {message: "Recipe successfully removed!"}
    rescue
      render json: {message: "No Recipe found"}
    end
  end
end
