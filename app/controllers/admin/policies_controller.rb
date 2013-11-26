class Admin::PoliciesController < AdminController

  def index
    @policies = Policy.all
  end

  def create
    @policy = Policy.new(params[:policy].merge({user_id: current_user.id}))
    if @policy.save
      flash[:notice] = 'Polisa zapisana'
    else
      flash[:alert] = 'Błąd podczas zapisu polisy'
    end
    redirect_to admin_policies_path
  end

  def update
    if @policy.update_attributes(params[:policy])
      flash[:notice] = 'Polisa zaktualizowana'
    else
      flash[:alert] = 'Polisa nie została zaktualizowana'
    end
    redirect_to admin_policies_path
  end


end
