Diction::Application.routes.draw do
  
  root to: 'words#index'	  				# Index Routing
  match '/search', 	to: "words#search"		# Search

  resources :words							

end
