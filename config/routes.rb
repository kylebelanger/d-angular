Diction::Application.routes.draw do
  
  get "users/new"

  root to: 'words#index'	  				# Index Routing
  match '/search', 	to: "words#create"		# Search

  resources :words							

end
