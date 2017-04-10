require 'rails_helper'

RSpec.describe Course, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @school=FactoryGirl.create(:school)
    @user=FactoryGirl.create(:user, school_id: @school.id)
    @course=FactoryGirl.create(:course, school_id: @school.id)
    @user_assign_course=FactoryGirl.create(:user_assign_course, school_id: @school.id)

  end

  describe '#class method search' do
    context 'when user_id present' do
      it 'should return courses of current user' do
        s_u_id=@user.id
        s_s_id=@school.id
        expect(Course.search(s_s_id, s_u_id)).to eq(@user.courses.collect { |course| {id: course.id, title: course.title} })
      end
    end
  end


end
