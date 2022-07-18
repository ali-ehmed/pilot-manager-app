module MessageBroker
  class ApprovePayments < Base
    def publish(payment)
      ch = channel.fanout("payments.approval")
      ch.publish(
        {
          payment_id: payment.payment_id,
          approved: payment.approved?,
          approved_at: payment.approved_at
        }.to_json
      )
    end
  end
end