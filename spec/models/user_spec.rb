require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user=User.create(first_name: 'Arif', last_name: 'Akash',user_name:'arif',email:'arif@gmail.com', password: 'abcde', salt: '12345', hashed_password: '1234')
  end

  describe '#instance method password' do
    it 'should assign password as hashed_password ' do
      expect(@user.password=(@user.password)).to eq('abcde')
    end
  end

  describe '#class method encrypt_password' do
    it 'should return encrypted password using Digest::SHA1.hexdigest(password + "wibble" + salt)' do
      expect(User.encrypt_password(@user.password, @user.salt)).to eq(Digest::SHA1.hexdigest('abcde' + 'wibble' + '12345'))
    end
  end

  describe '#class method authenticate' do
    context 'when user id present' do
      it 'should return current_user if and only if the hashed password== encrypt_password' do
        expect(User.find_by_user_name(@user.user_name)).to eq(@user)
      end
    end
  end

  describe '#instance method full_name' do
    it 'should return full_name of first_name+last_name' do
      expect(@user.full_name).to eq('Arif'+' '+'Akash')
    end
  end

end
