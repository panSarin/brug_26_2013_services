class PoliciesController < AuthenticationController

  def index
    @policies = current_user.policies
  end

  def create
    result = policy_service.process_create
    @policy = result[:policy]
    set_flash_message(result)
    if @policy.persisted?
      redirect_to policies_path
    else
      render :new
    end
  end

  def update
    result = policy_service.process_update
    @policy = result[:policy]
    set_flash_message(result)
    if @policy.errors.blank?
      redirect_to policies_path
    else
      render :edit
    end
  end

  def count
    result = 0
    params[:product_ids].split(",").each do |product|
      result = result + Product.find(product).price
    end
    render json: result.to_json
  end

  private
  def policy_service
    PolicyService.new(current_user, params, request)
  end


end
