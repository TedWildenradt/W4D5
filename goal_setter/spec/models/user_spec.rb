# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)} 
  
  describe 'session token' do 
    it 'should validate the presence of a session token' do
      user = User.create(email: 'dumb@email.com', password: 'password')
      # debugger
      expect(user.session_token).to_not be_nil
    end 
  end 
  
  describe '#find_by_credentials' do
    it 'should be able to find a user by their email and password' do 
      user = User.create(email: 'dumb@email.com', password: 'password')
      expect(user.find_by_credentials('dumb@email.com', 'password')).to eq(user)
    end
  end
end
