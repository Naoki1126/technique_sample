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
        @post = Post.find(params[:id])
        related_records = PostHashtag.where(post_id: @post.id).pluck(:hashtag_id)
        hashtags = Hashtag.all
        @hashtags = hashtags.select{|hashtag| related_records.include?(hashtag.id)}
        @display_caption = @post.caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/,"")

    end

    def edit
        @post = Post.find(params[:id])

    end


    def create
        @newpost = Post.new(post_params)
        @newpost.user_id = current_user.id
        hashtag = extract_hashtag(@newpost.caption)
        # @newpost.caption = delete_of_hashtag_text(@n]ewpost.caption)
        @newpost.save!
        save_hashtag(hashtag,@newpost)
        redirect_to posts_path

    end

    def update
        @post = Post.find(params[:id])
        strong_paramater = post_params
        post_params["image"] = @post.image_id if strong_paramater["image"].to_s.length <= 2 #ハッシュタグの実装には関係ないです。
        delete_records_related_to_hashtag(params[:id]) #こちらのメソッドで中間テーブルとハッシュタグのレコードを削除
        @post.update(post_params) 
        hashtag = extract_hashtag(@post.caption) #投稿よりハッシュタグを取得
        save_hashtag(hashtag,@post) #ハッシュタグの保存
        redirect_to posts_path

    end

    def destroy
        post = Post.find_by(id: params[:id]) #削除対象のレコード
        post.destroy #投稿を削除
        delete_records_related_to_hashtag(params[:id]) #中間テーブルとハッシュタグのレコードを削除
        redirect_to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:title, :caption,:image)
    end

end
