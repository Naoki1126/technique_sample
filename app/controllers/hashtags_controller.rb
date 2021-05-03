class HashtagsController < ApplicationController
    include HashtagMethods
    def index
        hashtags = Hashtag.all.select(:id,:name)
        hashtag_count = PostHashtag.all.group(:hashtag_id).count
        @hashtags = []
        hashtags.each_with_index do |hashtag,i|
            hashtag = hashtag.attributes
            hashtag["count"] = hashtag_count[hashtag["id"]]
            @hashtags << hashtag
        end
        if @hashtags.length > 1
            @hashtags = @hashtags.sort{ |a,b| b["count"] <=> a["count"]}
        end
    end

    def show
        post_hashtags = PostHashtag.all
        relationship_records = post_hashtags.select{ |ph| ph.hashtag_id == params[:id].to_i}.map(&:post_id) #中間テーブルの全レコードより、該当ハッシュタグIDが含まれるものを取得→post_idを配列に格納 #=> [1,3]
        all_posts = Post.all
        @posts = all_posts.select{ |post| relationship_records.include?(post.id)}
        @post_objects = creating_structures(posts: @posts,post_hashtags: post_hashtags ,hashtags: Hashtag.all)

    end
end
