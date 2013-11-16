class PoliciesController < AuthenticationController

  def index
    @policies = current_user.policies
  end

  def create
    @policy = Policy.new(params[:policy].merge({user_id: current_user.id}))
    if @policy.save
      flash[:notice] = 'Polisa zapisana'
    else
      flash[:alert] = 'Błąd podczas zapisu polisy'
    end
    redirect_to policies_path
  end

  def update
    if @policy.update_attributes(params[:policy])
      flash[:notice] = 'Polisa zaktualizowana'
    else
      flash[:alert] = 'Polisa nie została zaktualizowana'
    end
    redirect_to policies_path
  end

  def count
    result = 0
    params[:product_ids].split(",").each do |product|
      result = result + Product.find(product).price
    end
    render json: result.to_json
  end


end
