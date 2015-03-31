Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root :to => "tweets#index"
  resources :users
  resources :tweets do
    resources :replies
  end
end
