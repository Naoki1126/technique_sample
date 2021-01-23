class CsvtestController < ApplicationController

    def csv_output_test_js
    end

    def csv_test_ruby
        csv = CSV.parse('test_1.csv', :headers => true)
        @csvtext = []
        CSV.foreach('public/test_1.csv') do |row|
            @csvtext << row
        end
        @text = CSV.read('public/test_1.csv')
    end

    def output_to_message_with_a_js
    end

    def output_to_message_with_a_js2
    end

    def save_to_readcount_for_session
    end

    def save_to_readcount_for_localstorage
        render layout: 'localstorage_layout'
    end

    def check_localstorage_read
        render layout: 'localstorage_layout'
    end

end
