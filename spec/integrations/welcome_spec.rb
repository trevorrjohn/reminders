require 'spec_helper'

describe "Welcome Page" do
  before { visit root_path }

  context "user is not signed in" do
    it "has a link to homepage" do
      within "#navbar" do
        page.should have_link "Home", href: root_path
      end
    end

    it "should link to Sign Up page" do
      within '#navbar' do
        page.should have_link "Sign Up", href: new_user_registration_path
      end
    end

    it "should link to Sign In page" do
      within '#navbar' do
        page.should have_link "Sign In", href: new_user_session_path
      end
    end

    it "should not link to Sign Out page" do
      within '#navbar' do
        page.should_not have_link "Sign Out", href: destroy_user_session_path
      end
    end
  end

  context "user is signed in" do
    before do
      visit new_user_registration_path
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end

    it "has a link to homepage" do
      within "#navbar" do
        page.should have_link "Home", href: root_path
      end
    end

    it "should not link to Sign Up page" do
      within '#navbar' do
        page.should_not have_link "Sign Up", href: new_user_registration_path
      end
    end

    it "should not link to Sign In page" do
      within '#navbar' do
        page.should_not have_link "Sign In", href: new_user_session_path
      end
    end

    it "should link to Sign Out page" do
      within '#navbar' do
        page.should have_link "Sign Out", href: destroy_user_session_path
      end
    end

  end
end
