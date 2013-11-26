class PolicyService
  attr_reader :current_user, :params, :request

  def initialize(current_user, params, request)
    @current_user = current_user
    @params       = params
    @request      = request
    @notice       = ''
    @alert        = ''
    @abilities    = Ability.new(current_user)
  end

  def process_create
    policy = Policy.new(@params[:policy].merge({audit_params: @params, audit_referer: @request.referer, user_id: @current_user.id}))
    if commission_change_authorized?
      policy.save
      @notice = 'Policy created'
    else
      policy.errors[:messages] << {commission: 'Not enought privilages'}
      @alert = 'Policy not created - not enough privilages to change commission'
    end
    {policy: policy, notice: @notice, alert: @alert}
  end

  def process_update
    policy = Policy.find(@params[:id])
    if commission_change_authorized?
      policy.update_attributes(@params[:policy].merge({audit_params: @params, audit_referer: @request.referer}))
      @notice = 'Policy updated'
    else
      policy.errors[:messages] << {commission: 'Not enought privilages'}
      @alert = 'Policy not updated - not enough privilages to change commission'
    end
    {policy: policy, notice: @notice, alert: @alert}
  end


  private
  def commission_change_authorized?
    if @params[:policy][:commission].nil? || (@params[:policy][:commission].present? && @abilities.can?(:change_commission, Policy))
      true
    end
  end
end
