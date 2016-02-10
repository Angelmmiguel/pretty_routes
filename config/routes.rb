Rails.application.routes.draw do
  mount PrettyRoutes::Engine => '/pretty_routes', as: 'pretty_routes_engine'
  get 'rails/routes' => 'pretty_routes/routes#index'
  get 'rails/info/routes' => 'pretty_routes/routes#index'
end
