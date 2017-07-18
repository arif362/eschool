require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  before(:each) do
    @school=FactoryGirl.create(:school)
    @user=FactoryGirl.create(:user, school_id:@school.id)
    session[:school_id]=@school.id
    session[:user_id]=@user.id
  end

  describe 'Application Controller' do
    it 'Should request to Application controller current_school method' do
      session[:school]=@school.id
      expect(controller.current_school).to eq(@school)
    end

    it 'Should request to Application controller current_school method' do
      session[:school]=@school.id
      expect(controller.current_school).to eq(@school)
    end

    it 'Should request to Application controller current_user method' do
      expect(controller.current_user).to eq(@user)
    end


    

  end

end
