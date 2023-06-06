class ApiController < ApplicationController

    def get_test
        return_value = {
            "data":
                {
                    "place": "Tokyo",
                    "latitude": 36.57742818363322,
                    "longitude": 138.0319015
                }
        }

        render json: return_value

    end


    def post_test
        return_value = {
            "data":
                {
                    "place": "Tokyo",
                    "latitude": 36.57742818363322,
                    "longitude": 138.0319015
                }
        }

        render json: return_value

    end
end