class RequestPaymentsWorker
  include ::Sneakers::Worker

  from_queue PAYMENT_REQUESTS_EXCHANGE,
             exchange: PAYMENT_REQUESTS_EXCHANGE

  def work(raw_payment)
    payload = JSON.parse(raw_payment)
    PaymentRequest
      .create_with(payment_payload: payload)
      .find_or_create_by!(payment_id: payload.delete('id'))

    ack!
  end
end