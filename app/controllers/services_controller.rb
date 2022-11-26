class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @service =  Service.all

    if @service 
      render json: {
        status: 200,
        body: @service,
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal Server Error"
      }
    end
  end

  def show
    @service =  Service.find(service_params[:id])

    if @service
      render json: {
        status: 200,
        body: @service,
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal Server Error"
      }
    end
  end

  def create
    @service =  Service.new(service_params)
    if @service.save!
      render json: {
        status: 200,
        body: {
          message: "Successfully saved.",
          service: @service
        },
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal Server Error"
      }
    end
  end

  def update
    @service =  Service.find(service_params[:id])
    @service.apply_attributes(service_params)

    if @service.save!
      render json: {
        status: 200,
        body: {
          message: "Successfully updated.",
          service: @service
        },
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal Server Error"
      }
    end
  end

  def destroy
    @service =  Service.find(service_params[:id])

    if @service.destroy!
      render json: {
        status: 200,
        body: "Successfully deleted.",
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal Server Error"
      }
    end
  end

  private

  def service_params
    params.require(:service).permit(:id, :name, :description, :price)
end
