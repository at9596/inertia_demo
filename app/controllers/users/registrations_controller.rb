# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    render inertia: 'Auth/Register'
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)

      redirect_to tasks_path,
        notice: 'Account created successfully'
    else
      render inertia: 'Auth/Register',
        props: {
          errors: resource.errors
        },
        status: :unprocessable_entity
    end
  end
end
