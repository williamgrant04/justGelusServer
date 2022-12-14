class SessionsController < Devise::SessionsController
  respond_to :json

  def logged_in?
    if current_user
      respond_with({
        status: 200, 
        body: {
          user: current_user,
          logged_in: true
        },
        errors: nil
      })
    else
      respond_with({
        status: 200, 
        body: {
          user: nil,
          logged_in: false
        },
        errors: nil
      })
    end
  end
  
  private
  
  # Buncha methods I didn't write
  def respond_with(resource, _opts = {})
    render json: resource
  end
  
  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: {
      status: 200,
      body: {
        message: "Successfully logged out.",
        logged_in: false
      },
      errors: nil
    }
  end

  def log_out_failure
    render json: { 
      status: 500,
      body: {
        message: nil,
        logged_in: true
      },
      errors: "Internal server error"
    }
  end
end