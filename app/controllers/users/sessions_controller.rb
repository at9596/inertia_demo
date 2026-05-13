# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   respond_to :html, :json

  def new
    render inertia: 'Auth/Login'
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    redirect_to tasks_path,
      notice: 'Signed in successfully'
  end

   def destroy
    sign_out(resource_name)

    redirect_to new_user_session_path,
      notice: 'Signed out successfully'
  end
  
end
