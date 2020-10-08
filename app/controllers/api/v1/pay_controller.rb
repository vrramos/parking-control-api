module Api
	module V1
    class PayController < ApplicationController
      
      def update
				client = Parking.find(params[:id])

				if client.paid
					render json: {message:'Payment has already been made!'},status: :ok
				elsif client.paid == false
					client.paid = true
					client.save
					render json: {message:'Payment Accepted'},status: :unauthorized
				else	
					render json: {message:'ERROR'},status: :unprocessable_entity
				end
			end

		end
	end
end
