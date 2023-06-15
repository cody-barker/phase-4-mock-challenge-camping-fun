class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_resp
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_resp

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def find_camper
        Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

    def record_not_found_resp
        render json: {errors: "Camper not found"}, status: :not_found
    end

    def unprocessable_entity_resp(exception)
        render json: {error: exception.record.errors}, status: :unprocessable_entity
    end
end
