
Rails.application.routes.draw do
  
  root to: "site#index"

  match 'auth/:provider/callback', to: 'omniauth#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/sign_up", to: 'users#new', as: "sign_up"
  get "/logout", to: 'omniauth#destroy'
  resources :users do
    resources :events do
      resources :tasks
    end
  end

  get "/contact", to: "site#contact"
  get "/about", to: "site#about"

  # resources :events
  # get  "/users/user_id/events", to: "events#index", as: "events"
  # post "/users/user_id/events", to: "events#create"
  # get  "/users/user_id/events/new", to: "events#new", as: "new_event"
  # get  "/users/user_id/events/:event_id/edit", to: "events#edit", as: "edit_event"
  # get  "/users/user_id/events/:event_id", to: "events#show", as: "event"
  # patch "/users/user_id/events/:event_id", to: "events#update", as: "update_event"
  # put   "/users/user_id/events/:event_id", to: "events#update"
  # delete "/users/user_id/events/:event_id", to: "events#destroy", as: "destroy_event"

  # get "/events/:event_id/tasks", to: "tasks#index", as: "tasks"
  # get "/events/:event_id/tasks/new", to: "tasks#new", as: "new_task"
  # get "/events/:event_id/tasks/:task_id", to: "tasks#show", as: "task"
  # get "/events/:event_id/tasks/:task_id/edit", to: "tasks#edit", as: "edit_task"

  # post "/events/:event_id/tasks", to: "tasks#create"
  # post "/events/:event_id/tasks/:task_id", to: "tasks#update", as: "task_update"
  # delete "/events/:event_id/tasks/:task_id", to: "tasks#destroy", as: "destroy_task"

  
end


#  Prefix Verb     URI Pattern                                               Controller#Action
#                 root GET      /                                                         site#index
#                      GET|POST /auth/:provider/callback(.:format)                        omniauth#create
#         auth_failure GET|POST /auth/failure(.:format)                                   redirect(301, /)
#                login GET      /login(.:format)                                          sessions#new
#             sessions POST     /sessions(.:format)                                       sessions#create
#              sign_up GET      /sign_up(.:format)                                        users#new
#               logout GET      /logout(.:format)                                         omniauth#destroy
#     user_event_tasks GET      /users/:user_id/events/:event_id/tasks(.:format)          tasks#index
#                      POST     /users/:user_id/events/:event_id/tasks(.:format)          tasks#create
#  new_user_event_task GET      /users/:user_id/events/:event_id/tasks/new(.:format)      tasks#new
# edit_user_event_task GET      /users/:user_id/events/:event_id/tasks/:id/edit(.:format) tasks#edit
#      user_event_task GET      /users/:user_id/events/:event_id/tasks/:id(.:format)      tasks#show
#                      PATCH    /users/:user_id/events/:event_id/tasks/:id(.:format)      tasks#update
#                      PUT      /users/:user_id/events/:event_id/tasks/:id(.:format)      tasks#update
#                      DELETE   /users/:user_id/events/:event_id/tasks/:id(.:format)      tasks#destroy
#          user_events GET      /users/:user_id/events(.:format)                          events#index
#                      POST     /users/:user_id/events(.:format)                          events#create
#       new_user_event GET      /users/:user_id/events/new(.:format)                      events#new
#      edit_user_event GET      /users/:user_id/events/:id/edit(.:format)                 events#edit
#           user_event GET      /users/:user_id/events/:id(.:format)                      events#show
#                      PATCH    /users/:user_id/events/:id(.:format)                      events#update
#                      PUT      /users/:user_id/events/:id(.:format)                      events#update
#                      DELETE   /users/:user_id/events/:id(.:format)                      events#destroy
#                users GET      /users(.:format)                                          users#index
#                      POST     /users(.:format)                                          users#create
#             new_user GET      /users/new(.:format)                                      users#new
#            edit_user GET      /users/:id/edit(.:format)                                 users#edit
#                 user GET      /users/:id(.:format)                                      users#show
#                      PATCH    /users/:id(.:format)                                      users#update
#                      PUT      /users/:id(.:format)                                      users#update
#                      DELETE   /users/:id(.:format)                                      users#destroy
#              contact GET      /contact(.:format)                                        site#contact
#                about GET      /about(.:format)                                          site#about





#  Prefix Verb     URI Pattern                                     Controller#Action
#         root GET      /                                               site#index
#              GET|POST /auth/:provider/callback(.:format)              omniauth#create
# auth_failure GET|POST /auth/failure(.:format)                         redirect(301, /)
#        login GET      /login(.:format)                                sessions#new
#     sessions POST     /sessions(.:format)                             sessions#create
#      sign_up GET      /sign_up(.:format)                              users#new
#       logout GET      /logout(.:format)                               omniauth#destroy
#        users GET      /users(.:format)                                users#index
#              POST     /users(.:format)                                users#create
#     new_user GET      /users/new(.:format)                            users#new
#    edit_user GET      /users/:id/edit(.:format)                       users#edit
#         user GET      /users/:id(.:format)                            users#show
#              PATCH    /users/:id(.:format)                            users#update
#              PUT      /users/:id(.:format)                            users#update
#              DELETE   /users/:id(.:format)                            users#destroy
#      contact GET      /contact(.:format)                              site#contact
#        about GET      /about(.:format)                                site#about
#       events GET      /events(.:format)                               events#index
#              POST     /events(.:format)                               events#create
#    new_event GET      /events/new(.:format)                           events#new
#   edit_event GET      /events/:id/edit(.:format)                      events#edit
#        event GET      /events/:id(.:format)                           events#show
#              PATCH    /events/:id(.:format)                           events#update
#              PUT      /events/:id(.:format)                           events#update
#              DELETE   /events/:id(.:format)                           events#destroy
#        tasks GET      /events/:event_id/tasks(.:format)               tasks#index
#     new_task GET      /events/:event_id/tasks/new(.:format)           tasks#new
#         task GET      /events/:event_id/tasks/:task_id(.:format)      tasks#show
#    edit_task GET      /events/:event_id/tasks/:task_id/edit(.:format) tasks#edit
#              POST     /events/:event_id/tasks(.:format)               tasks#create
#  task_update POST     /events/:event_id/tasks/:task_id(.:format)      tasks#update
# destroy_task DELETE   /events/:event_id/tasks/:task_id(.:format)      tasks#destroy
