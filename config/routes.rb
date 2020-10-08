require 'api_version_constraint'

Rails.application.routes.draw do
	namespace :api, defaults: { format: :json }, path: '/' do
		namespace :v1 , path:'/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
			resources :parking
			resources :out
			resources :pay
		end
  end
end