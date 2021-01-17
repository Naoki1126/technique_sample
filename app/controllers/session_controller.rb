class SessionController < ApplicationController

    def read
    end

    def sava
        if params[:message_count]
            session[:message_count] = params[:message_count]
            current_user.assign_attributes(session[:message_count])
        end
    end

    def destroy
    end
end