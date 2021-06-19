class KubotaController < ApplicationController

    def index
        render layout: false
    end

    def kubota_map
        # render layout: false
    end

    def map
        
        if params[:address].include?("久保田の家")
            @latlng = [36.57742818363322, 160.0319015]
        else
            results = Geocoder.search(params[:address])
            # @latlng = results.first.coordinates
            @latlng = [
                [36.57742818363322, 120.0319015],
                [24.9999,122.99999],
                [36.55555,125.999990],
                [38.44444444,28.9999999]
            ]
        end
        respond_to do |format|
          format.js
        end
    end

end
