require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @course=FactoryGirl.create(:course, school_id: @school.id)
    @course_1=FactoryGirl.create(:course, school_id: @school.id)
    @user=FactoryGirl.create(:user, school_id: @school.id)
  end
  describe 'Course Controller get #index' do
    it 'should request to course controller index ' do
      get :index
      expect(response).to be_success
    
    end

  end

end
