module Api
	module V1
    class PayController < ApplicationController
      
      def update
				paid = Parking.find(params[:id])
				if paid.update_attributes(paid_params)
					render json: {message:'Payment Received'},status: :ok
				else
					render json: {message:'Payment Not Accepted'},status: :unauthorized
				end
			end

			# Parametros aceitos
			private
			def paid_params
				params.permit(:paid)
			end

		end
	end
end
