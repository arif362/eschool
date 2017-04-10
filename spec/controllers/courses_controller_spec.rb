require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @course=FactoryGirl.create(:course, school_id: @school.id)
    @course_1=FactoryGirl.create(:course, school_id: @school.id)
    @user=FactoryGirl.create(:user, school_id: @school.id)
    session[:school_id]=@school.id
  end
  describe 'get #index' do
    it 'should request to course controller index action' do
      get :index
      expect(response).to be_success
      expect(assigns(:courses)).to eq([@course, @course_1])
    end
  end
  describe 'get #new ' do
    it 'should request to course controller new action' do
      get :new
      expect(response).to be_success
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe 'post#create' do
    it 'should request to course controller create action' do
      post :create, course: {title: Faker::Book.title, author: Faker::Book.author, school_id: @school.id}
      expect(response).to redirect_to(courses_path)
    end
  end
  describe 'get#show' do
    it 'should request to course controller show action' do
      get :show, id: @course.id
      expect(response).to be_success
      expect(assigns(:course)).to eq(@course)
    end
  end

  describe 'get#edit' do
    it 'should request to course controller edit action' do
      get :edit, id: @course.id
      expect(response).to be_success
      expect(assigns(:course)).to eq(@course)
    end
  end

  describe 'put#update' do
    it 'should request to course controller update action' do
      put :update, id: @course.id, course: {title: Faker::Book.title, school_id: @school.id}
      expect(response).to redirect_to(course_path)
    end
  end
  describe 'delete#destroy' do
    it 'should request to course controller destroy action' do
      count = Course.all.count
      delete :destroy, id: @course.id
      expect(Course.all.count).to eq(count-1)
      expect(response).to redirect_to(courses_path)
    end
  end

end
