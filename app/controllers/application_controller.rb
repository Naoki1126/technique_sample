class ApplicationController < ActionController::Base

    # protect_from_forgery with: :exception

    before_action :http_header_log
    
    private
    
    def http_header_log
        logger.debug("api_version:#{request.headers[:HTTP_API_VERSION]}")
    end
      
end