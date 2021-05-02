class PostsController < ApplicationController


    def index
        @posts = Post.all
        @hashtags = Hashtag.all
        @post_hashtag = PostHashtag.all
    end

    def new
        @newpost = Post.new

    end

    def create
        @newpost = Post.new(post_params)
        @newpost.user_id = current_user.id

        if @newpost.save
            hashtag = extract_hashtag(@newpost.caption)
            save_hashtag(hashtag)
            redirect_to posts_path
        end

    end

    def destroy

    end

    private

    #--------------ハッシュタグ保存処理　create アクションの中で実行　----------------
    def extract_hashtag(caption)
        if caption.blank? #例外処理のため。まずあり得ないが、引数が空で渡ってきた場合は処理をしない
            return
        end
        # 入力された文字列の中より、＃で始まる文字列を配列にして返す
        return caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) #=> ["#aaa","#bbb"]
        
    end

    def save_hashtag(hashtag_array)

        if hashtag_array.blank? #例外処理のため。ハッシュタグを付けずに投稿された時、下のメソッドを実行させないようにする。
            return
        end

        hashtag_array.uniq.map do |hashtag|
            # ハッシュタグは先頭の#を外し、小文字にして保存
            tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
            #-------中間テーブルへの保存処理--------
            post_hashtag = PostHashtag.new #中間テーブルのインスタンスを作成
            post_hashtag.post_id = @newpost.id 
            post_hashtag.hashtag_id = tag.id
            post_hashtag.save
        end
    end

    def post_params
        params.require(:post).permit(:title, :caption)
      end
    

end
