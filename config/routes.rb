Todoptec::Application.routes.draw do

  devise_for :users

  root :to => "lists#home", :as => :home

  resources :users do
    resources :lists
  end

end
