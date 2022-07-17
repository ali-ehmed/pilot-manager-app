class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.recently_approved
  end
end
