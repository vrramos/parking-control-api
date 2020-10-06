module Api
	module V1
		class ParkingController < ApplicationController

			# Listar todos os artigos
			def index
				puts request.raw_post
				list_all = Parking.order('created_at');
				render json: {status: 'SUCCESS', data:list_all},status: :ok
			end
						
			def create
				new_vehicle = Parking.new(parking_params)
				puts new_vehicle
				if new_vehicle.save
					render json: {status: 'SUCCESS', data:new_vehicle},status: :ok
				else
					render json: {status: 'ERROR', data:newVehicle.erros},status: :unprocessable_entity
				end
			end

			# Parametros aceitos
			private
			def parking_params
				params.permit(:plate)
			end
			
		end
	end
end