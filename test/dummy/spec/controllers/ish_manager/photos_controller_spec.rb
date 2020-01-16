require 'spec_helper'
require 'rails_helper'
describe IshManager::PhotosController, :type => :controller do
  routes { IshManager::Engine.routes }
  before :each do
    Site.unscoped.destroy
    @site = FactoryGirl.create :site

    Gallery.unscoped.destroy
    @gallery = Gallery.create :site => @site

    Photo.unscoped.destroy
    @photo = FactoryGirl.create :photo, :gallery => @gallery

    setup_users
  end

  context '#destroy' do
    it '#destroy - access denied' do
      allow(controller).to receive(:current_user).and_return(UserStub.new(:manager => false))
      n = Photo.count
      delete :destroy, :params => { :id => @photo.id }
      session[:flash]['flashes']['alert'].should_not eql nil
      Photo.count.should eql n
    end

    it '#destroy - ok for sudoer' do
      allow(controller).to receive(:current_user).and_return(UserStub.new(:sudoer => true))
      n = Photo.count
      delete :destroy, :params => { :id => @photo.id }
      Photo.count.should eql n-1
    end
  end

end
