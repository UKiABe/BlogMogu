Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :photos, only: [:create, :update]
  devise_scope :user do
    # write all your routes inside this block
    root to: "blogs#index"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
