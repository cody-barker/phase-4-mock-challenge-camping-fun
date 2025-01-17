class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_resp

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = find_activity
        activity.destroy
    end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def record_not_found_resp
        render json: {error: "Activity not found"}, status: :not_found
    end

end
