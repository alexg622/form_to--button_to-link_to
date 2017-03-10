class AnimalsController < ApplicationController
	before_action :find_category, except: [:new]
	

	def new
		find_category
		@animal = Animal.new
	end 

	def create
		find_category
		@animal = Animal.new(animal_params)
		if @animal.save
			redirect_to @category
		else
			render 'new'
		end 
	end 

	def edit
		find_category
		@animal = Animal.find(params[:id])
	end 

	def update
		p "******************"
		p params
		p "*****************"
		p update_animal_params
		p "******************"
		@category = Category.find(params[:category_id])
		@animal = Animal.find(params[:id])
		if @animal.save
			if update_animal_params[:name] == nil
				@animal.update(animal_params)
			else
				@animal.update(update_animal_params)
			end  
			redirect_to @category
		else 
			render 'edit'
		end 
	end 

	def destroy
		find_category
		@animal=Animal.find(params[:id])
		@animal.delete
		redirect_to @category
	end 

	private
	def animal_params
		params.require(:animal).permit(:category_id, :name, :specie)
	end 
	def update_animal_params
		animal = {
			name: params[:name],
			specie: params[:specie]
		}
	end 

	def find_category
		@category = Category.find(params[:category_id])
	end
end
