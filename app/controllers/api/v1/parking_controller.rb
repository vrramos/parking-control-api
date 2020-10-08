require 'json'
require 'services'

module Api
	module V1
		class ParkingController < ApplicationController

			def index
				all = Parking.order('created_at')
				render json: {data:all},status: :ok
			end

			# Listar veículo por placa
			def show
				services = Services.new
				data = Parking.where("plate = ?", params[:id])
				total_minutes = services.calculating_time(data)
				data_att = data.each{ |key| key.time="#{total_minutes.round(2)} minutes"}

				render json: {vehicle_information:data_att},status: :ok
			end
			
			# Cadastra um novo veículo.
			def create
				services = Services.new
				new_vehicle = Parking.new(parking_params)
				license_plate = JSON.parse(request.body.read)['plate']

				if services.mask_plate(license_plate)
					new_vehicle.save
					render json: {vehicle_identification:new_vehicle.id},status: :created
				elsif
					render json: {message: 'Plate Format Invalid'},status: :unauthorized
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
