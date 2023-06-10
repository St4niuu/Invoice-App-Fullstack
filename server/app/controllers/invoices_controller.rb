class InvoicesController < ApplicationController

  before_action :authenticate_user!

  def index
    @invoices = Invoice.find_by(user_id: current_user.id)
    render json: {data: @invoices}
  end

  def create
    body = JSON.parse(request.body.read)
    @invoice = Invoice.new
    body.each do |key, value|
      @invoice[key.to_sym] = value
    end
    if @invoice.save
      render json: {status: 200, message: 'Record added.'}, status: :ok
    else
      render json: {status: 500, message: 'Error occured.'}, status: :internal_server_error
    end
  end

end
