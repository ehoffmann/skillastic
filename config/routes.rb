Rails.application.routes.draw do
  # Customers
  namespace :customers do
    get 'home' => 'home#workers'
    get 'skill/:id' => 'home#skill', as: :skill
  end

  # Workers
  namespace :workers do
    get 'home' => 'home#index'
    post 'skills' => 'skills#add'
    delete 'skills' => 'skills#remove'
  end

  devise_for :workers
  devise_for :customers
  get 'welcome/index'
  root 'welcome#index'
end
