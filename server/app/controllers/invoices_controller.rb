class InvoicesController < ApplicationController

  before_action :authenticate_user!

  def index
    @invoices = Invoice.find_by(user_id: current_user.id)
    render json: {data: @invoices}
  end

  def create
    body = JSON.parse(request.body.read)
    @invoice = Invoice.new(user_id: current_user.id)
    body.each do |key, value|
      @invoice[key.to_sym] = value
    end
    if @invoice.save
      render json: {status: 200, message: 'Record added.'}, status: :ok
    else
      render json: {status: 500, message: 'Error occured.'}, status: :internal_server_error
    end
  end

  def destroy
    @invoice = Invoice.find_by(id: params[:id], user_id: current_user.id)
    if @invoice.destroy
      render json: {status: 200, message: 'Record deleted.'}, status: :ok
    else
      render json: {status: 500, message: 'Error occured.'}, status: :internal_server_error
    end
  end

  def update
    body = JSON.parse(request.body.read)
    @invoice = Invoice.find_by(id: params[:id], user_id: current_user.id)
    body.each do |key, value|
      @invoice[key.to_sym] = value
    end
    if @invoice.save
      render json: {status: 200, message: 'Record modified.'}, status: :ok
    else
      render json: {status: 500, message: 'Error occured.'}, status: :internal_server_error
    end
  end

end
