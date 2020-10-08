Rails.application.routes.draw do
  namespace :questions do
    get 'answers/create'
  end
  resources :answers
  resources :questions
  root to: 'welcome#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
