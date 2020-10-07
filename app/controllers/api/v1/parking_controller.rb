require 'json'

module Api
	module V1
		class ParkingController < ApplicationController

			def mask(plate)
				return !!plate.match(/[a-zA-Z]{3}[-][0-9]{4}/)
			end

			# Listar todos veículos
			def index
				list_all = Parking.order('created_at');
				render json: {status: 'SUCCESS', data:list_all},status: :ok
			end
						
			def create
				new_vehicle = Parking.new(parking_params)

				if new_vehicle.save
					license_plate = JSON.parse(request.body.read)['plate']
					if mask(license_plate)
						render json: {vehicle_identification:new_vehicle.id},status: :ok 
					else
						render json: {message: 'Plate Format Invalid'}
					end
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
