# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  # Rescues
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  # Callbacks
  before_action -> { set_ransack_object(Talk) }

  # create ld_json_structure
  def ld_json_script(ld_json_hash)
    content_tag(:script, type: 'application/ld+json') do
      raw JSON.generate(ld_json_hash)
    end
  end

  # set ransack object
  def set_ransack_object(model)
    @q = model.send(:ransack, params[:q])
  end

  private

  def not_authorized
    flash[:notice] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
