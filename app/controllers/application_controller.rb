class ApplicationController < ActionController::Base
  before_action :share_inertia_data
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private
  
   def share_inertia_data
    inertia_share auth: {
      user: current_user&.as_json(
        only: %i[id email]
      )
    }
  end
end
