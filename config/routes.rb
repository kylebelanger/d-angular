Diction::Application.routes.draw do
  
  root to: 'words#index'	  # Index Routing

  resources :words

  #match '/search', 	to: "words#show"

end
