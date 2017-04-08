require 'rails_helper'

RSpec.describe UserAssignCoursesController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @course=FactoryGirl.create(:course, school_id: @school.id)
    @user=FactoryGirl.create(:user, school_id: @school.id)
    @user_assign_course=FactoryGirl.create(:user_assign_course, school_id: @school.id)
    session[:school_id]=@school.id
  end

  describe 'get#index' do
    it 'should request to index action of user_assign_courses_controller' do
      get :index
      expect(response).to be_success
    end
  end
  describe 'get#new' do
    it 'should request to new action of user_assign_courses_controller' do
      get :new
      expect(response).to be_success
    end
  end
  describe 'post#create' do
    it 'should request to create action of user_assign_courses_controller' do
      post :create, user_assign_course: {user_id: @user.id, course_id: @course.id}
      expect(response).to redirect_to(new_user_assign_course_path)
    end
  end
end
