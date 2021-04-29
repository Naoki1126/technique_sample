class PostsController < ApplicationController


    def index
        @posts = Post.all
        
    end

    def new
        @newpost = Post.new
        @newpost.title = params[:title]
        @newpost.caption = params[:caption]

    end

    def create

    end

    def destroy

    end

end
