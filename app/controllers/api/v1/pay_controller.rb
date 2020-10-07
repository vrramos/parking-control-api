require 'json'

module Api
	module V1
    class PayController < ApplicationController
      
      def update
				paid = Parking.find(params[:id])
				if paid.update_attributes(paid_params)
					render json: {message:'Payment Made'},status: :ok
				else
					render json: {message:'Pagamento não realizado'},status: :unprocessable_entity
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
