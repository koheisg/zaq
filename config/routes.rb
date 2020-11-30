Rails.application.routes.draw do
  resources :tagings
  resources :tags
  resources :questions do
    resources :answers, module: :questions
    resources :likes, module: :questions
  end
  resources :users, path: '/', only: :show do
    resources :questions, only: :index, module: :users
    resources :answers, only: :index, module: :users
  end
  get '/auth/:provider/callback', to: 'sessions#create'
  controller :sessions do
    delete 'logout' => :destroy
  end
  root to: 'welcome#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
