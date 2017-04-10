require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @user=FactoryGirl.create(:user, user_name: Faker::Name.name, school_id: @school.id)
    @user_1=FactoryGirl.create(:user, user_name: Faker::Name.name, role: User::USER_ROLE[:student], school_id: @school.id)
  end

  describe 'Application Controller' do
    context 'if current_school present' do
      it 'should request to application controller current_school method and return current school' do
        session[:school_id]=@school.id
        expect(controller.current_school).to eq(@school)
      end
    end
    context 'if current_school not present and user present' do
      it 'should request to application controller current_school method and return school of current user' do
        session[:user_id]=@user.id
        expect(controller.current_school).to eq(@school)
      end
    end
  end

  describe 'Application Controller #current_user instance method' do
    it 'should request to current_course method and return ' do
      session[:user_id]=@user.id
      expect(controller.current_user).to eq(@user)
    end
  end
  describe 'Application Controller #current_students instance method' do
    it 'should request to current_course method and return ' do
      session[:school_id]=@school.id
      expect(controller.current_students).to eq([@user_1])
    end
  end

end
