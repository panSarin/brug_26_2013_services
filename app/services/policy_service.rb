#encoding: utf-8
class ClientBusinessService

  attr_reader :current_user, :params, :request

  def initialize(current_user, params, request)
    @current_user = current_user
    @params       = params
    @request      = request
  end

  def process_create
    client_business = ClientBusiness.new(@params[:client_business])
    if client_business.save
      notice = "Klient został utworzony"
    else
      alert = "Błąd podczas tworzenia klienta"
    end
    {client: client_business, notice: notice, alert: alert}
  end

  def process_update
    client_business = ClientBusiness.find(@params[:id])
    if client_business.update_attributes(@params[:client_business].merge({audit_params: @params, audit_referer: @request.referer}))
      notice = "Dane klienta zostały zaktualizowane"
    else
      alert = 'Błąd podczas edycji klienta'
    end
    {client: client_business, notice: notice, alert: alert}
  end

end
