class KubotaController < ApplicationController

    def index
        render layout: false
    end

    def kubota_map
        # render layout: false
    end

    def map
        
        # if params[:address].include?("久保田の家")
        #     @latlng = [36.57742818363322, 160.0319015]
        # else
        #     results = Geocoder.search(params[:address])
        #     # @latlng = results.first.coordinates
        #     @latlng = [
        #         [36.57742818363322, 120.0319015],
        #         [24.9999,122.99999],
        #         [36.55555,125.999990],
        #         [38.44444444,28.9999999]
        #     ]
        # end
        # respond_to do |format|
        #   format.js
        # end
        return_value = {
            "data":[
                {
                    "place": "家❶",
                    "latitude": 36.57742818363322,
                    "longitude": 138.0319015
                },
                {
                    "place": "カフェ",
                    "latitude":36.999322,
                    "longitude": 138.99999
                },
                {
                    "place": "会社",
                    "latitude": 36.55555,
                    "longitude": 139.0319015
                },
                {
                    "place": "実家",
                    "latitude": 36.5833318363322,
                    "longitude": 138.999990
                },
                {
                    "place": "現在地",
                    "latitude": 37.44444444,
                    "longitude": 138.199999
                }
            ]
        }

        render json: return_value

    end

end
