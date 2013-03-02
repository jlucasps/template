Todoptec::Application.routes.draw do

  devise_for :users

  root :to => "lists#index", :as => :index

end
