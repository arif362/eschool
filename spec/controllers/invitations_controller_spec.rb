require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  before(:each) do
    @school=FactoryGirl.create(:school)
    @invitation=FactoryGirl.create(:invitation, email: Faker::Internet.email)

  end
  describe 'get#new' do
    it 'should request Invitation controller new action ' do
      get :new
      expect(response).to be_success
    end
  end
  describe 'get#create' do
    it 'should request Invitation controller create action' do
      post :create, invitation: {email: Faker::Internet.email}
      expect(response).to redirect_to(users_path)
    end
  end
end
