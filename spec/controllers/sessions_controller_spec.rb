require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user=FactoryGirl.create(:user)
    @school=FactoryGirl.create(:school)
    #@session=FactoryGirl.create(:session)

    # session[:user_id]=@user.id
    # session[:school_id]=@school.id
  end

  describe 'get#new' do
    it 'should request to new action of Session Controller ' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'post#create' do
    it 'should request to create action of Session Controller ' do
      post :create, session: {user_name: Faker::Name.name, password: 'password'}
      expect(response).to redirect_to(login_url)
    end
  end


  describe 'get#admin_login' do
    it 'should request to admin_login action of Session Controller ' do
      get :admin_login
      expect(response).to be_success
    end
  end

  describe 'post#add' do
    it 'should request to add action of Session Controller ' do
      post :add, session: {user_name: Faker::Name.name, password: 'password'}
      expect(response).to redirect_to(admin_login_url)
    end
  end

  describe 'delete#destroy' do
    it 'should request to destroy action of Session Controller ' do
      delete :destroy, id: @user.id
      delete :destroy, id: @school.id
      expect(response).to redirect_to(schools_path)
    end
  end

end
