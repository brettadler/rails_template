# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  # Default route
  root "welcomes#index"

  # Device routes
  devise_for :users
  # devise_for :users, controllers: { sessions: "sessions", registrations: 'registrations' }

  # Routes that are only available to admin users
  authenticated :user, -> (user) { user.admin? } do
    mount DelayedJobWeb, at: "/delayed_job"
    mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  end

  # Routes that are only available to logged in users
  authenticated :user do
  end

  # Redirect all unknown routes to root_url
  get '*path' => redirect('/')

end
