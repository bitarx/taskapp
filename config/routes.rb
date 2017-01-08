Rails.application.routes.draw do
  resources :projects do
    resources :tasks, controller: 'projects/tasks', only:[:create, :destroy]
  end

  root 'projects#index'
end
