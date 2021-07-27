require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  context 'validations' do
    it 'should have a valid factory' do
      expect(subject).to be_valid 
    end

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to be_invalid
    end

    it 'must have a unique username' do
      FactoryBot.create(:user, username: 'test')
      subject.username = 'test'
      expect(subject).to be_invalid
    end
  end
  
  context 'user type' do
    let(:user_types) { [:hostess, :admin] }
    it 'has the right index' do
      user_types.each_with_index do |type, index|
        expect(described_class.user_types[type]).to eq index
      end
    end
  end
end
