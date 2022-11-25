class SessionsController < Devise::SessionsController
  # before_action :authenticate_user!

    respond_to :json
    def logged_in?
      # binding.pry
      if current_user
        respond_with({ user: current_user, logged_in: true })
      else
        respond_with({ user: nil, logged_in: false })
      end
    end
    
    private
    
    def respond_with(resource, _opts = {})
      # binding.pry
      render json: resource
    end
    
    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def log_out_success
      render json: { message: "You are logged out." }, status: :ok
    end
  
    def log_out_failure
      render json: { message: "Hmm nothing happened."}
    end
  end