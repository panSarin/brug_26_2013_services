class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def set_flash_message(result)
    result[:notice].present? ? flash[:notice] = result[:notice] : flash[:alert] = result[:alert]
  end

end
