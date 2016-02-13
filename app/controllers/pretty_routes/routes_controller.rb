module PrettyRoutes
  #
  # Route controller. It displays all routes in your application
  #
  class RoutesController < PrettyRoutes::ApplicationController
    include PrettyRoutes::RoutesHelper

    layout 'pretty_routes/application'

    before_filter :require_local!

    def index
      @routes = PrettyRoutes.format_routes
    end

    private

    def require_local!
      return if local_request?
      render text: '<p>For security purposes, this information is only' \
                   'available to local requests.</p>',
             status: :forbidden
    end

    def local_request?
      Rails.application.config.consider_all_requests_local || request.local?
    end
  end
end
