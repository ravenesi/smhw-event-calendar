Rails.application.routes.draw do
  resources :events, only: [ :index, :create ]
  resources(
    :events,
    only: [ :new ],
    constraints: {
      format: :json
    }
  )
end
