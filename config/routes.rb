Rails.application.routes.draw do
  resources :questions do
    resources :answers, module: :questions
  end
  resources :users, path: '/', only: :show do
    resources :questions, only: :index, module: :users
    resources :answers, only: :index, module: :users
  end
  root to: 'welcome#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
