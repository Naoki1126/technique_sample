class SessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def read
    end

    def save
        if params[:message_count]
            session[:message_count] = params[:message_count]
        end
       
    end

    def destroy

    end
end