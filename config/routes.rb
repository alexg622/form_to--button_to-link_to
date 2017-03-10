Rails.application.routes.draw do
	get "/" => "categories#index"
	resources :categories do 
		resources :animals
	end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
