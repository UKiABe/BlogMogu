Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  devise_scope :user do
    # write all your routes inside this block
    root to: "blogs#index"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
