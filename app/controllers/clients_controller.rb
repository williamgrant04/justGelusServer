class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all

    render json: {
      status: 200,
      body: @clients,
      errors: nil
    }
  end

  def show
    @client = Client.find(client_params[:id])

    if @client 
      render json: {
        status: 200,
        body: @client,
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
    @client = Client.new(client_params)

    if @client.save!
      render json: {
        status: 200,
        body: {
          message: "Successfully created.",
          client: @client
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
    @client = Client.find(client_params[:id])
    @client.assign_attributes(client_params)

    if @client.save!
      render json: {
        status: 200,
        body: {
          message: "Successfully updated.",
          client: @client
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
    @client = Client.find(client_params[:id])

    if @client.destroy!
      render json: {
        status: 200,
        body: "Successfully destroyed.",
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
  
  def client_params
    params.require(:client).permit(:id, :name, :phone_number, :email, :allergies)
  end
end
