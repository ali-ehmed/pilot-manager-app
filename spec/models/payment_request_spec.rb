require 'rails_helper'

RSpec.describe PaymentRequest, type: :model do
  subject { build(:payment_request) }

  context 'Instance Methods' do
    describe '#approve!' do
      it 'sets approved as true and approved sent at' do
        expect(subject.approved).to be_nil
        subject.approve!(true)
        expect(subject.approved).to be_truthy
        expect(subject.approved_at).to_not be_nil
      end

      it 'sets approved as false and approved sent at' do
        expect(subject.approved).to be_nil
        subject.approve!(false)
        expect(subject.approved).to be_falsey
        expect(subject.approved_at).to be_nil
      end
    end
  end
end
