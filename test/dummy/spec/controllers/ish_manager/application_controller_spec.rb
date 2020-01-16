require 'spec_helper'
require 'rails_helper'
describe IshManager::ApplicationController, :type => :controller do
  routes { IshManager::Engine.routes }
  render_views
  before :each do
    setup_users
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))

    Gallery.all.destroy
    @gallery = FactoryGirl.create :gallery, :name => 'xx-test-gallery-xx'
  end

  it '#home - header for guy' do
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
    get :home
    response.should be_success
    response.should render_template( :partial => '_main_header_guy' )
  end

  it '#home - header for admin' do
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))
    get :home
    response.should be_success
    response.should render_template( :partial => '_main_header_admin' )
  end
end
