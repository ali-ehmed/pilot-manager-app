class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.latest
  end

  def update
    @payment_request = PaymentRequest.find(params[:id])
    @payment_request.approve!(params[:approved])
    redirect_to payment_requests_path, notice: "Payment #{@payment_request.approved? ? 'approved' : 'rejected'}"
  end
end
