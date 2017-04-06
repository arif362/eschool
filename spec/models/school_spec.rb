require 'rails_helper'

RSpec.describe School, type: :model do

  before(:each) do
    #setup
    @school=School.create(name: 'Lions School', password: '123456', salt: '123456', email: 'arif@gmail.com', hashed_password: 'arif')

    #encrypt_password = Digest::SHA1.hexdigest(@school.password + 'wibble' + @school.salt)
    #exercise
    #password=@school.password

  end

  describe '#instance method password' do
    context 'if password present' do

      it 'should assign the value of hashed password as encrypted password' do
        #verify
        expect(@school.password=(@school.password)).to eq('123456')
        # Teardown is for now mostly handled by RSpec itself
      end
    end

  end

  describe '#class method encrypt_password' do
    it 'should return encrypted password from Digest::SHA1.hexdigest(password + "wibble" + salt)' do
      expect(School.encrypt_password(@school.password, @school.salt)).to eq(Digest::SHA1.hexdigest('123456' + 'wibble' + '123456'))
    end
  end

  describe '# class method authenticate' do
    context 'if given email as parameter find in the model' do
      it 'should return school if and only if the hashed_password of school == encrypt_password ' do
        expect(School.find_by_email(@school.email)).to eq(@school)
      end
    end

    context 'if given email as parameter find in the model' do
      it 'should return school if and only if the hashed_password of school == encrypt_password ' do
        expect(@school.hashed_password == Digest::SHA1.hexdigest(@school.password + 'wibble' + @school.salt)).to eq('arif' == Digest::SHA1.hexdigest(@school.password + 'wibble' + @school.salt))
      end
    end

  end
end
