Rails.application.routes.draw do
	root 'designs#new'
	resources :faourites, only: [:index]
	resources :designs do
		collection do
			get 'random_search'
		end
	end
end