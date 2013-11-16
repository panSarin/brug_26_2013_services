class AdminController < AuthenticationController
  before_filter :check_admin?
  layout 'admin'

  private
  def check_admin?
    redirect_to root_path unless current_user.role?('admin')
  end

end
