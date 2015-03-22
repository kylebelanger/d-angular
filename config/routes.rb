Rails.application.routes.draw do
	resources :words

  	root to: 'application#index'	  							# Index Routing
  	post '/search', to: "words#search"							# Search

end
