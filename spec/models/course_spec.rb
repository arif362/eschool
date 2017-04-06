require 'rails_helper'

RSpec.describe Course, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @school=School.create(name:'Lions School')
    @course=Course.create(title:'Ruby', school_id:@school.id)
    @course_1=Course.create(title:'Ruby', school_id:@school.id)
    @user=User.create(first_name:'Arif', school_id:@school.id)
  end

  describe '#class method search' do
    context 'when user_id present' do
      it 'should return courses of current user' do
        expect(@user.courses).to eq(@user.courses.collect{|course| {id: course.id ,title:course.title}})
      end
    end
    context 'when user_id not present' do
      it 'should return courses of current user' do
        expect(@school.courses).to eq(@school.courses.collect{|course| {id: course.id ,title:course.title}})
      end
    end

  end


end
