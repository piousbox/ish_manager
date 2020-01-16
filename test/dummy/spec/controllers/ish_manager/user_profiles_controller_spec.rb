require 'spec_helper'
require 'rails_helper'

describe IshManager::UserProfilesController, :type => :controller do
  render_views
  routes { IshManager::Engine.routes }

  before :each do
    User.all.destroy
    @user = FactoryGirl.create :user
    sign_in @user, :scope => :user

    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))

    @profile = IshModels::UserProfile.new :user => @user, :email => 'some@email.com', :name => 'some-name-2'
    @profile.save
    @profile.persisted?.should eql true
  end

  describe '#new' do
    it 'renders' do
      get :new
      response.should be_success
    end
  end

  describe '#edit' do
    it 'renders' do
      get :edit, :params => { :id => @profile.id }
      response.should be_success
    end
  end

end
