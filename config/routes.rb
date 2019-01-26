Rails.application.routes.draw do
	root 'designs#new'
	resources :designs do
		collection do
			get 'random_search'
		end
	end
end