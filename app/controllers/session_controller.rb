class SessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def read
        if session[:message_count]
            @test = session[:message_count]
        end
    end

    def save
        if params[:message_count]
            session[:message_count] = params[:message_count]
        end
    end

    def destroy
       if session[:message_count]
        session[:message_count].clear
       end
        path = request.referer
        redirect_to path
    end
end