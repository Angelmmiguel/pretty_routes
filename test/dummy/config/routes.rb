Dummy::Application.routes.draw do
  resources :foo, id: %r{([^\/])+?}
  resources :bar

  # mount_pretty_routes
end
