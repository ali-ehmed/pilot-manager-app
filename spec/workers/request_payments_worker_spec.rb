require 'rails_helper'

RSpec.describe RequestPaymentsWorker do
  subject { described_class.new }
  let!(:payment_request) { build(:payment_request) }

  describe '#work' do
    it 'creates a payment request' do
      subject.work({ id: Faker::Internet.uuid, initial_status: 'pending', request_sent_at: DateTime.now }.to_json)
      expect(PaymentRequest.count).to eql(1)
    end

    it 'finds existing payment request' do
      subject.work({ id: Faker::Internet.uuid, initial_status: 'pending', request_sent_at: DateTime.now }.to_json)
      expect(PaymentRequest.count).to eql(1)

      existing_payment_request = PaymentRequest.last
      described_class.new.work({ id: existing_payment_request.payment_id, initial_status: 'pending', request_sent_at: DateTime.now }.to_json)
      expect(PaymentRequest.count).to eql(1)
    end
  end
end
