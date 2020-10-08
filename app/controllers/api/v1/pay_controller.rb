module Api
	module V1
    class PayController < ApplicationController
      
      def update
				client = Parking.find(params[:id])

				if client.paid
					render json: {message:'Payment has already been made!'},status: :unauthorized
				elsif client.paid == false
					client.paid = true
					client.save
					render json: {message:'Payment Accepted'},status: :ok
				else	
					render json: {message:'ERROR'},status: :unprocessable_entity
				end
			end

		end
	end
end
