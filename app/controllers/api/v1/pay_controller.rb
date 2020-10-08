module Api
	module V1
    class PayController < ApplicationController
      
      def update
				client = Parking.find(params[:id])

				if client.paid
					render json: {message:'Pagamento Já foi realizado!'},status: :ok
				elsif client.paid == false
					client.paid = true
					client.save
					render json: {message:'Payment Accepted'},status: :unauthorized
				else	
					render json: {message:'Payment Not Accepted'},status: :unauthorized
				end
			end

		end
	end
end
