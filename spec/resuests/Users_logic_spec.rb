require 'spec_helper'

describe 'Users Application Logic' do
  describe 'User Website Registration' do

    before(:each) do
      @user=FactoryGirl.create(:user)
    end

    it 'allows new users to register with an email address and password' do
      visit '/users/sign_up'

      fill_in 'Email',                 :with => 'alindeman@example.com'
      fill_in 'Password',              :with => 'ilovegrapes'
      fill_in 'Password confirmation', :with => 'ilovegrapes'

      click_button 'Sign up'

      page.should have_content(I18n.translate('devise.registrations.signed_up'))
    end

    it 'not allows new users to register with an existent email address' do
      visit '/users/sign_up'

      fill_in 'Email',                 :with => @user.email
      fill_in 'Password',              :with => 'ilovegrapes'
      fill_in 'Password confirmation', :with => 'ilovegrapes'

      click_button 'Sign up'

      page.should_not have_content(I18n.translate('devise.registrations.signed_up'))
    end

    it 'allows users to sign in after they have registered' do

      visit '/users/sign_in'

      fill_in 'Email',    :with => @user.email
      fill_in 'Password', :with => @user.password

      click_button 'Sign in'

      page.should have_content(I18n.translate('devise.sessions.signed_in'))
    end
  end
end