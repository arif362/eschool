require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
  end

  describe 'get#index' do
    it 'should request to School Controller index action' do
      get :index
      expect(response).to be_success
      expect(assigns(:schools)).to eq([@school])
    end
  end
  describe 'get#new' do
    it 'should request to School Controller new action' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'post#create' do
    context 'if school parameters are saved' do
      it 'should request to School Controller create action' do
        post :create, school: {name: Faker::Name.name, email: Faker::Internet.email, password: 'password'}
        expect(response).to redirect_to(admin_login_url)
      end
    end
    context 'if school parameters are not saved' do
      it 'should request to School Controller new action' do
        post :create, school: {name: Faker::Name.name, email: Faker::Internet.email}
        expect(response).to redirect_to(new_school_path)
      end
    end
  end

  describe 'get#show' do
    it 'should request to School Controller Show action' do
      get :show, id: @school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(@school)
    end
  end
  describe 'get#edit' do
    it 'should request to School Controller edit action' do
      get :edit, id: @school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(@school)
    end
  end

  describe 'put#update' do
    it 'should request to School Controller Update action' do
      put :update, id: @school.id, school: {name: Faker::Name.name}
      expect(response).to redirect_to(school_path)
    end
  end
end
