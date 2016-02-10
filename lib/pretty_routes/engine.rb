module PrettyRoutes
  #
  # Create an isloated space for PrettyRoutes
  #
  class Engine < Rails::Engine
    isolate_namespace PrettyRoutes
  end
end
