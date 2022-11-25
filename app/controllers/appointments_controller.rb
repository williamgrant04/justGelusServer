class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.where.not(archived: true)

    render json: {
      status: 200,
      body: @appointments,
      errors: nil
    }
  end

  def show
    @appointment = Appointment.find(appointment_params[:id])

    render json: {
      status: 200,
      body: @appointment,
      errors: nil
    }
  end

  def create
    @appointment = Appointment.new(appointment_params.except(:client_id, :service_ids))
    @appointment.client = Client.find(appointment_params[:client_id])
    @appointment.services = Service.where(id: appointment_params[:service_ids])

    if @appointment.save!
      render json: {
        status: 200,
        body: ["Successfully created.", @appointment],
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal server error"
      }
    end
  end

  def destroy
    @appointment = Appointment.find(appointment_params[:id])
    if @appointment.destroy!
      render json: {
        status: 200,
        body: "Successfully deleted.",
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal server error"
      }
    end
  end

  def archive
    @appointment = Appointment.where.not(archived: true).find(appointment_params[:id])
    @appointment.archived = true
    
    if @appointment.save!
      render json: {
        status: 200,
        body: "Successfully archived.",
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: "Internal server error"
      }
    end
  end

  def update
    @appointment = Appointment.find(:id)
    @appointment.assign_attributes(appointment_params)

    if @appointment.save!
      render json: {
        status: 200,
        body: "Successfully updated.",
        errors: nil
      }
    else
      render json: {
        status: 500,
        body: nil,
        errors: 'Internal server error'
      }
    end
  end
end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :apt_date_time, :at_home, :archived, :client_id, :service_ids, :id)
  end
end
