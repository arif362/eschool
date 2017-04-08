require 'rails_helper'

RSpec.describe KlassesController, type: :controller do

  before(:each) do
    @school=FactoryGirl.create(:school)
    @klass=FactoryGirl.create(:klass, school_id: @school.id)
    @klass_1=FactoryGirl.create(:klass, school_id: @school.id)
    session[:school_id]=@school.id
  end

  describe 'get#index' do
    it 'should request to klasses controller index action' do
      get :index
      expect(response).to be_success
      expect(assigns(:klasses)).to eq([@klass, @klass_1])
    end
  end

  describe 'get#new' do
    it 'should request to klasses controller new action' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'post#create' do
    it 'should request to Klasses Controller create action' do
      post :create, klass: {room_no: Faker::Number.number(3), email: Faker::Internet.email, school_id: @school.id}
      expect(response).to redirect_to(klasses_path)
    end
  end
  describe 'get#show' do
    it 'should request to Klasses Controller show action' do
      get :show, id: @klass.id
      expect(response).to be_success
      expect(assigns(:klass)).to eq(@klass)
    end
  end

  describe 'get#edit' do
    it 'should request to Klasses Controller edit action' do
      get :edit, id: @klass.id
      expect(response).to be_success
      expect(assigns(:klass)).to eq(@klass)
    end
  end

  describe 'put#update' do
    it 'should request to Klasses Controller update action' do
      put :update, id: @klass.id, klass: {room_no: Faker::Number.number(3), email: Faker::Internet.email, school_id: @school.id}
      expect(response).to redirect_to(klass_path)
    end
  end

  describe 'delete#destroy' do
    it 'should request to Klasses Controller destroy action' do
      count= Klass.count
      delete :destroy, id: @klass.id
      expect(Klass.count).to eq(count-1)
      expect(response).to redirect_to(klasses_path)
    end
  end

end
