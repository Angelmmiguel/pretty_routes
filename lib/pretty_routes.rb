require 'pretty_routes/engine'

#
# Base module of pretty routes
#
module PrettyRoutes
  begin
    require 'rails/application/route_inspector'
    ROUTE_INSPECTOR = Rails::Application::RouteInspector.new
  rescue LoadError
    require 'action_dispatch/routing/inspector'
    ROUTE_INSPECTOR = ActionDispatch::Routing::RoutesInspector.new([])
  end

  def self.format_routes(routes = all_routes)
    # ActionDispatch::Routing::RoutesInspector.new.collect_routes(_routes.routes)
    rails_routes = ROUTE_INSPECTOR.send :collect_routes, routes
    # PArse rails routes to find constraints
    rails_routes.each do |route|
      next unless route[:reqs].include?(' {')
      reqs = route[:reqs].split(' ')
      route[:reqs] = reqs.first
      route[:constraints] = reqs.last
    end
    # Return parsed
    rails_routes
  end

  def self.all_routes
    Rails.application.reload_routes!
    Rails.application.routes.routes
  end
end
