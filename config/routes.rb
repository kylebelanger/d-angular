Rails.application.routes.draw do

	resources :words, :users

  	root to: 'application#index'	  							# Index Routing
  	post '/search', to: "words#search"							# Search
   	#get 'signup', to: "users#new"


end
