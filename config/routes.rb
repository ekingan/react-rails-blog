Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  	member do
  		put :like, to:'posts#upvote'
  		put :dislike, to:'posts#downvote'
      get :category, to: "categories#post_category"
      get :user, to: "user#post_user"
  	end
    collection do
    get :search
    end
  end

  root 'posts#index'

  get '/topposts', to: 'pages#topposts', as: 'topposts'
  get '/randomposts', to: 'pages#randomposts', as: 'randomposts'
  get 'category/:id',to: 'categories#show', as: 'category'

end
