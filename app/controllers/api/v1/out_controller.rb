module Api
	module V1
		class OutController < ApplicationController
      
      def update
				get_out = Parking.find(params[:id])

				if get_out.paid
					get_out.update_attributes(out_params)
					render json: {message: 'You can go out. Thanks!'},status: :ok
				else
					render json: {message: 'Pay First.'},status: :unauthorized
				end
			end
			
			# Parametros aceitos
			private
			def out_params
				params.permit(:left)
			end

		end
	end
end
