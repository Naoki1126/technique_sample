class SessionController < ApplicationController

    def read
        if params[:sassion]
            session[:user] = params[:session]
        end
    end

    def sava
    end

    def destroy
    end
end