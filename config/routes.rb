Rails.application.routes.draw do
  devise_for :users,
               path: '/',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout'
               },
               controllers: {
                 sessions: 'sessions'
               }
  devise_scope :user do
    get "/logged_in" => "sessions", action: :logged_in?
  end

  #* Services
  get '/services/index',     to: 'services#index'
  get '/services/:id',      to: 'services#show'
  post '/services/create',   to: 'services#create'
  patch '/services/update',  to: 'services#update'
  delete '/services/delete', to: 'services#delete'

  #* Clients
  get '/clients/index',      to: 'clients#index'
  get '/clients/:id',       to: 'clients#show'
  post '/clients/create',    to: 'clients#create'
  patch '/clients/update',   to: 'clients#update'
  delete '/clients/destroy', to: 'clients#destroy'

  #* Appointments
  get '/appointments/index',      to: 'appointments#index'
  get '/appointments/:id',       to: 'appointments#show'
  post '/appointments/create',    to: 'appointments#create'
  delete '/appointments/destroy', to: 'appointments#destroy'
  patch '/appointments/archive',  to: 'appointments#archive'
  patch '/appointments/update',   to: 'appointments#update'
end
