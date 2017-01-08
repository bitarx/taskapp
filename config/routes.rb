Rails.application.routes.draw do
  resources :projects do
    resources :tasks, controller: 'projects/tasks', only:[:create, :destroy] do
      resource :done, controller: 'projects/tasks/done', only:[:update]
  end
  end

  root 'projects#index'
end
