require 'spec_helper'
require 'rails_helper'
describe IshManager::CoTailorsController, :type => :controller do
  render_views
  routes { IshManager::Engine.routes }

  before :each do
    setup_users
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))
  end

  it '#home' do
    get :home
    response.should be_success
    assigns( :products ).should_not eql nil
  end

end
