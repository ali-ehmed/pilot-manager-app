class RequestPaymentsWorker
  include ::Sneakers::Worker

  from_queue PAYMENT_REQUESTS_EXCHANGE,
             exchange: PAYMENT_REQUESTS_EXCHANGE

  def work(raw_payment)
    puts '*' * 100
    pp raw_payment
    ack!
  end
end