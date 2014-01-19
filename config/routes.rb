Diction::Application.routes.draw do
  
  # Index Routing
  root to: 'application#index'

  match '/search', 	to: 'words#create'

end
