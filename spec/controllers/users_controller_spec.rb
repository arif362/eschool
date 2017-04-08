require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @user=FactoryGirl.create(:user, school_id: @school.id)

  end
  describe 'get#index' do
    it 'should request to index action of Users controller' do
      session[:school_id]=@school.id
      get :index
      expect(response).to be_success
      expect(assigns(:users)).to eq([@user])
    end
  end
  describe 'get#student_list' do
    it 'should request to student_list action of Users controller' do
      session[:school_id]=@school.id
      get :student_list
      expect(response).to be_success
    end
  end
  describe 'get#teacher_list' do
    it 'should request to teacher_list action of Users controller' do
      session[:school_id]=@school.id
      get :teacher_list
      expect(response).to be_success
    end
  end
  describe 'get#parent_list' do
    it 'should request to parent_list action of Users controller' do
      session[:school_id]=@school.id
      get :parent_list
      expect(response).to be_success
    end
  end
  describe 'get#new' do
    context 'if current_school present' do
      it 'should request to new action of Users controller' do
        session[:school_id]=@school.id
        get :new
        expect(response).to be_success
      end
    end
    context 'if current_school not present' do
      it 'should request to new action of Users controller' do
        get :new
        expect(response).to be_success
      end
    end
  end
  describe 'post#create' do
    context 'if current_school present' do
      it 'should request to create action of Users controller' do
        session[:school_id]=@school.id
        post :create, user: {user_name: Faker::Name.name, password: 'password', email: Faker::Internet.email}
        expect(response).to redirect_to(users_path)
      end
    end
    context 'if current_school not present' do
      it 'should request to create action of Users controller' do
        post :create, user: {user_name: Faker::Name.name, password: 'password', email: Faker::Internet.email}
        expect(response).to redirect_to(login_path)
      end
    end
    context 'if current_school not present and user parameter not saved' do
      it 'should request to create action of Users controller' do
        post :create, user: {email: Faker::Internet.email}
        expect(response).to redirect_to(new_user_path)
      end
    end

  end
  describe 'get#show' do
    it 'should request to show action of Users controller' do
      session[:school_id]=@school.id
      get :show, id: @user.id
      expect(response).to be_success
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe 'get#edit' do
    it 'should request to edit action of Users controller' do
      session[:school_id]=@school.id
      get :edit, id: @user.id
      expect(response).to be_success
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe 'put#update' do
    it 'should request to update action of Users controller' do
      session[:school_id]=@school.id
      put :update, id: @user.id, user: {first_name: Faker::Name.first_name}
      expect(response).to redirect_to(users_path)
    end
  end

  describe 'delete#destroy' do
    it 'should request to destroy action of Users controller' do
      session[:school_id]=@school.id
      count=User.count
      delete :destroy, id: @user.id
      expect(User.count).to eq(count-1)
      expect(response).to redirect_to(users_path)
    end
  end


end
