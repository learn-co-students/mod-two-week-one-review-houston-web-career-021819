Rails.application.routes.draw do
  resources :seas

  get '/', to: 'seas#welcome'
end
