Rails.application.routes.draw do
  resources :tagings
  resources :tags
  resources :questions do
    resources :answers, module: :questions
    resources :likes, module: :questions
  end
  get '/auth/:provider/callback', to: 'sessions#create'
  controller :sessions do
    get 'login' => :new
    delete 'logout' => :destroy
  end
  root to: 'welcome#show'
  resources :users, path: '/', only: :show do
    resources :questions, only: :index, module: :users
    resources :answers, only: :index, module: :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
