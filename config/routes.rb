
Rails.application.routes.draw do
  
  root to: "site#index"

  match 'auth/:provider/callback', to: 'omniauth#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/sign_up", to: 'users#new', as: "sign_up"
  get "/logout", to: 'omniauth#destroy'
  resources :users

  get "/contact", to: "site#contact"
  get "/about", to: "site#about"

  resources :events

  get "/events/:event_id/tasks", to: "tasks#index", as: "tasks"
  get "/events/:event_id/tasks/new", to: "tasks#new", as: "new_task"
  get "/events/:event_id/tasks/:task_id", to: "tasks#show", as: "task"
  get "/events/:event_id/tasks/:task_id/edit", to: "tasks#edit", as: "edit_task"

  post "/events/:event_id/tasks", to: "tasks#create"
  post "/events/:event_id/tasks/:task_id", to: "tasks#update", as: "task_update"
  delete "/events/:event_id/tasks/:task_id", to: "tasks#destroy", as: "destroy_task"

  
end
