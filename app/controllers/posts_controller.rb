class PostsController < ApplicationController
    include HashtagMethods
    before_action :authenticate_user!

    def index
        @posts = Post.all
        @hashtags = Hashtag.all
        @post_hashtags = PostHashtag.all
        @post_objects = creating_structures(posts: @posts,post_hashtags: @post_hashtags,hashtags: @hashtags)

    end

    def new
        @newpost = Post.new

    end

    def show

    end

    def edit

    end


    def create
        @newpost = Post.new(post_params)
        @newpost.user_id = current_user.id
        hashtag = extract_hashtag(@newpost.caption)
        # @newpost.caption = delete_of_hashtag_text(@n]ewpost.caption)
        @newpost.save!
        save_hashtag(hashtag)
        redirect_to posts_path

    end

    def update
    end

    def destroy
        post = Post.find(params[:id])
        relationship_reccords = PostHashtag.where(post_id: post.id)
        post.destroy
        if relationship_records
            relationship_records.destroy
        end
        redirect_to posts_path

    end


    private

    def post_params
        params.require(:post).permit(:title, :caption,:image)
    end

end
