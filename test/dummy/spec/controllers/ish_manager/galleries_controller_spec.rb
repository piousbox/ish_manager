require 'spec_helper'
require 'rails_helper'
describe IshManager::GalleriesController, :type => :controller do
  render_views
  routes { IshManager::Engine.routes }

  before :each do
    setup_users
    Gallery.all.destroy
    @gallery = FactoryGirl.create :gallery, :name => 'xx-test-gallery-xx', :user_profile => controller.current_user.profile
  end

  it '#index' do
    get :index
    assigns( :shared_galleries ).should eql nil
  end
  
  it '#index_titles' do
    get :index, :params => { :render_type => Gallery::RENDER_TITLES }
    response.should render_template 'index_titles'
    assigns( :shared_galleries ).should eql nil
    gs = assigns( :galleries )
    gs.length.should > 0
  end

  describe 'show' do
    it 'shows trash' do
      get :show, :params => { :id => @gallery.id }
      assigns( :deleted_photos ).should_not eql nil
    end
  end

  describe 'new' do
    it 'renders' do
      get :new
      response.should be_success
      assigns( :gallery ).should_not eql nil
    end
  end

  describe 'update' do
    it 'sends email to new shared profiles' do
      setup_profiles
      @gallery.shared_profiles = [ @profiles[0], @profiles[1] ]
      @gallery.save

      expect( ::IshManager::ApplicationMailer ).to receive( :shared_galleries ).with( [ @profiles[2] ], @gallery ).and_return(OpenStruct.new)
      post :update, :params => { :id => @gallery.id, :gallery => { :shared_profiles => [ @profiles[1].id, @profiles[2].id ] } }
    end
  end

  it 'create' do
    n_galleries = Gallery.count
    post :create, :params => { :gallery => { :name => "abba-#{rand(100)}" } }
    Gallery.count.should eql n_galleries+1
  end

end
