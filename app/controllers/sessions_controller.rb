#encoding: utf-8
class SessionsController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, flash[:alert] => exception.message
  end

  def destroy
   session[:current_user_id] = nil
   session[:logged] = nil
   redirect_to root_url, notice: 'Wylogowano'
  end

  def autologin
    binding.pry
    sign_in User.find(params[:id])
    redirect_to root_path
  end
end
