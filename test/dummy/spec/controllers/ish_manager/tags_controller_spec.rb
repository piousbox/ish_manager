require 'spec_helper'
require 'rails_helper'
describe IshManager::TagsController, :type => :controller do
  render_views
  routes { IshManager::Engine.routes }

  before :each do
    setup_users
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))

    setup_tags
  end

  describe 'new' do
    it 'renders' do
      get :new
      response.should be_success
    end
  end

  it '#index' do
    get :index
    response.should be_success
  end

  it '#show' do
    get :show, :params => { :id => @tag.id }
    response.should be_success
  end

end
