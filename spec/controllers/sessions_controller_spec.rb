require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @user=FactoryGirl.create(:user, school_id: @school.id)
  end

  describe 'get#new' do
    it 'should request to new action of Session Controller ' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'post#create' do
    context 'if authentication is valid' do
      it 'should request to create action of Session Controller ' do
        s_u_name=@user.user_name
        post :create, user_name: s_u_name, password: 'password'
        session[:user_id]=@user.id
        expect(response).to redirect_to(user_path(@user))
      end
    end
    context 'if authentication is not valid' do
      it 'should request to create action of Session Controller ' do
        post :create
        session[:user_id]=@user.id
        expect(response).to redirect_to(login_url)
      end
    end
  end

  describe 'get#admin_login' do
    it 'should request to admin_login action of Session Controller ' do
      get :admin_login
      expect(response).to be_success
    end
  end

  describe 'post#add' do
    context 'if authentication is valid for school email' do
      it 'should request to add action of Session Controller ' do
        session_email_address=@school.email
        post :add, email: session_email_address, password: 'password'
        expect(response).to redirect_to(school_path(@school))
      end
    end
    context 'if authentication is not valid for school email' do
      it 'should request to add action of Session Controller ' do
        post :add, email: Faker::Internet.email, password: 'password'
        expect(response).to redirect_to(admin_login_url)
      end
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
