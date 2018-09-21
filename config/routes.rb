Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  get 'tweets' => 'tweets#index'
  get 'tweets/new'=> 'tweets#new'
  post 'tweets' => 'tweets#create'
  delete 'tweets/:id' => 'tweets#delete'
  get 'users/:id' => 'users#show'

end
