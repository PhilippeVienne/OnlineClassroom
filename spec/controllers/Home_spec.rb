require 'spec_helper'

describe HomeController do
  describe "GET index" do
    it "respond correctly" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "is the home page" do
      visit root_path
      page.should have_content(I18n.translate('home.welcome_message'))
      page.should have_content(I18n.translate('home.home'))
    end
  end
end