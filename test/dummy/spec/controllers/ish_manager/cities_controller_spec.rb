require 'spec_helper'
require 'rails_helper'
describe IshManager::CitiesController, :type => :controller do
  render_views
  routes { IshManager::Engine.routes }
  include Devise::Test::ControllerHelpers

  before :each do
    City.all.destroy
    @city = FactoryGirl.create :city

    User.all.destroy
    @user = FactoryGirl.create :user
    sign_in @user, :scope => :user
    
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))
  end
  
  describe 'new' do
    it 'renders' do
      get :new
      response.should be_success
    end
  end

  describe 'edit' do
    it 'renders' do
      get :edit, :params => { :id => @city.id }
      response.should be_success
    end
  end

end
