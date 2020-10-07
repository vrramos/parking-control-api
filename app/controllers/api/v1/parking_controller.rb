require 'json'

module Api
	module V1
		class ParkingController < ApplicationController

			def get_time(time)
				return time.scan(/[0-9]{2}[:][0-9]{2}:[0-9]{2}/)
			end

			def mask(plate)
				return !!plate.match(/[a-zA-Z]{3}[-][0-9]{4}/)
			end

			def index
				all = Parking.order('created_at')
				render json: {data:all},status: :ok
			end

			# Listar veículo por placa
			def show
				data = Parking.where("plate = ?", params[:id])
				created = data.map { |vehicle| "#{vehicle.created_at}"}
				created_string = created.join(', ')
				get_hour = get_time(created_string)
				t = Time.now
				a = t.strftime('%H:%M:%S')
				string_again = get_hour.join(', ')
				puts string_again
				puts a


				# puts created_string
				# minutes = ((updated - created) * 24 * 60).to_i
				# a.class
				render json: {data:data},status: :ok
			end
			
			# Cadastra um novo veículo.
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
