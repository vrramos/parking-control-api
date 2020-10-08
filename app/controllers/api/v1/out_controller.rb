module Api
	module V1
		class OutController < ApplicationController
			
      def update
				client = Parking.find(params[:id])

				if client.paid
					client.left = true
					client.save
					render json: {message: 'You can go out. Thanks!'},status: :ok
				elsif client.paid == false
					render json: {message: 'Pay First'},status: :unauthorized
				else	
					render json: {message:'ERROR'},status: :unprocessable_entity
				end
			end

		end
	end
end
