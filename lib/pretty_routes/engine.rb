module PrettyRoutes
  #
  # Create an isloated space for PrettyRoutes
  #
  class Engine < Rails::Engine
    require 'zeroclipboard-rails'
    isolate_namespace PrettyRoutes
  end
end
