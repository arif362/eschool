require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user=User.create(first_name:'Arif',last_name:'Akash',password:'abcde',salt:'12345',hashed_password:'1234')
  end

  describe '#instance method password' do
    it 'should return password as hashed_password' do
      expect(@user.password).to eq('abcde')
    end
  end

  describe '#class method encrypt_password' do
    it 'should return encrypted password using Digest::SHA1.hexdigest(password + "wibble" + salt)' do
      expect(Digest::SHA1.hexdigest(@user.password + 'wibble' + @user.salt)).to eq(Digest::SHA1.hexdigest('abcde' + 'wibble' + '12345'))
    end
  end

  describe '#class method authenticate' do
    context 'when user id present' do
      it 'should return current_user if and only if the hashed password== encrypt_password' do
        expect(@user.hashed_password == Digest::SHA1.hexdigest(@user.password + 'wibble' + @user.salt)).to eq('1234' == Digest::SHA1.hexdigest('abcde' + 'wibble' + '12345'))
      end
    end
  end

  describe '#instance method full_name' do
    it 'should return full_name of first_name+last_name' do
      expect(@user.first_name + ' ' + @user.last_name).to eq('Arif'+' '+'Akash')
    end
  end

  # describe '#instance method generate_salt' do
  #   it 'should return salt' do
  #    # expect(@user.salt= @user.object_id.to_s + rand.to_s).to eq( 12345 = @user.object_id.to_s + rand.to_s)
  #   end
  # end
end
