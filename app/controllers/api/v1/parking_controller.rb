Module Api
	module V1
		class ParkingController < ApplicationController
						
			def create
				new_vehicle = Parking.new(parking_params)
				if new_vehicle.save
					render json: {status: 'SUCCESS', number_resevation:new_vehicle.id},status: :ok
				else
					render json: {status: 'ERROR', data:newVehicle.erros},status: :unprocessable_entity
				end
			end

			# Listar todos veículos
			def index
				list_all = Parking.order('created_at');
				render json: {status: 'SUCCESS', data:list_all},status: :ok
			end

			# Parametros aceitos
			private
			def parking_params
				params.permit(:plate)
			end

		end
	end
end