Reminders::Application.routes.draw do
  resources :reminders

  devise_for :users

  root :to => 'welcome#index'
end
