module HashtagMethods
    extend ActiveSupport::Concern

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
                post_hashtag.save!
            end
        end

        def delete_of_hashtag_text(text)
            text.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/,"") #渡された文字列の中より#で始まる文字列を””に変換する
        end

        def creating_structures(posts: "",post_hashtags: "",hashtags: "")
            #引数として必要なのはPostの全データ、中間テーブルの全データ、ハッシュタグの全てのデータです。
            #このメソッドはPostのActiviRecordオブジェクトをハッシュに変換し、更に一つ一つのオブジェクトに対し、Idに紐づくハッシュタグを配列として格納するメソッドです。
            array = [] #最終戻り値用
            posts.each do |post|
                hashtag = [] #中間テーブルのID情報から探したハッシュタグを格納するための配列
                post_hash = post.attributes #ActiveRecordインスタンスをハッシュに変換 { key => val, key=> val}
                related_hashtag_records = post_hashtags.select{|ph| ph.post_id == post.id } #中間テーブルより投稿Idが一致するレコードを取り出す
                related_hashtag_records.each do |record|
                    hashtag << hashtags.detect{ |hashtag| hashtag.id == record.hashtag_id } #上記レコードをもとにハッシュタグを検索し、配列に格納
                end
                post_hash["hashtag"] = hashtag #投稿一つ一つのデータに['hashtag']のkeyを追加、そこにハッシュタグのデータを格納する
                array << post_hash #=> [{"id"=>1, "title"=>"aaaa", "caption"=>"#aaaa\r\n#bbbb\r\ncccc\r\ndddd", "created_at"=>Sun, 02 May 2021 15:13:42 UTC +00:00, "updated_at"=>Sun, 02 May 2021 15:13:42 UTC +00:00, "user_id"=>1, "image_id"=>"e347a197a5c2e6466db2d5b1673792c0a7b3a37460b1dea00f36b8b366a6", "hashtag"=>[#<Hashtag id: 1, name: "aaaa", created_at: "2021-05-02 15:13:42", updated_at: "2021-05-02 15:13:42">}]
            end
            return array
        end

end