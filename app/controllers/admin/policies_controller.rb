class Admin::PoliciesController < AdminController

  def index
    @policies = Policy.all
  end

  def create
    result = policy_service.process_create
    @policy = result[:policy]
    set_flash_message(result)
    if @policy.persisted?
      redirect_to admin_policies_path
    else
      render :new
    end
  end

  def update
    result = policy_service.process_update
    @policy = result[:policy]
    set_flash_message(result)
    if @policy.errors.blank?
      redirect_to admin_policies_path
    else
      render :edit
    end
  end

  private
  def policy_service
    PolicyService.new(current_user, params, request)
  end


end
