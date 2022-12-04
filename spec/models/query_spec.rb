require 'rails_helper'

RSpec.describe Query, type: :model do
  subject { described_class.new(user_id: 1_234_567, identifier: 123_456, query: 'New query', found: true) }

  context 'validation test' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an activity identification' do
      subject.identifier = nil
      expect(subject).to_not be_valid
    end

    it 'counter is autoincremented' do
      expect(subject.counter).to eql(1)
    end
  end
end