class RecipesController < ApplicationController
	def index
		render json: { recipes: Recipe.all() }
	end

	def create
		new_recipe = Recipe.new(
			title: params[:title],
			making_time: params[:making_time],
			serves: params[:serves],
			ingredients: params[:ingredients],
			cost: params[:cost]
		)

		if new_recipe.save
			render json: {
				message: "Recipe successfully created!",
				recipe: [
					new_recipe
				]
			}
		else
			render json: {
				message: "Recipe creation failed!",
				required: "title, making_time, serves, ingredients, cost"
			}
		end
	end

	def show
		id = params[:id]
		recipe = Recipe.find_by(id: id)
		render json: {
			message: "Recipe details by id",
			recipe: [
				recipe
			]
		}
	end

	def update
		id = params[:id]
		recipe = Recipe.find_by(id: id)
		if recipe.nil?
			render json: { message: "Recipe not found" }, status: :not_found
		end

		recipe[:title] = params[:title]
		recipe[:making_time] = params[:making_time]
		recipe[:serves] = params[:serves]
		recipe[:ingredients] = params[:ingredients]
		recipe[:cost] = params[:cost]

		if recipe.update(
			title: params[:title],
			making_time: params[:making_time],
			serves: params[:serves],
			ingredients: params[:ingredients],
			cost: params[:cost]
		)
			render json: {
				message: "Recipe successfully updated!",
				recipe: recipe
			}
		end
	end

	def destroy
		id = params[:id]
		recipe = Recipe.find_by(id: id)

		if recipe.present? && recipe.destroy
			render json: { message: "Recipe successfully removed!" }
		else
			render json: { message: "No Recipe found" }, status: :not_found
		end

	end
end
