class CsvtestController < ApplicationController

    def csv_test_js
    end

    def csv_test_ruby
        csv = CSV.parse('test_1.csv', :headers => true)
        @csvtext = []
        CSV.foreach('public/test_1.csv') do |row|
            @csvtext << row
        end
        @text = CSV.read('public/test_1.csv')
    end

end
