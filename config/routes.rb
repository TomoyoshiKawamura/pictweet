Rails.application.routes.draw do
  get 'tweets' => 'tweets#index'
  get 'tweets/new'=> 'tweets#new'
end
