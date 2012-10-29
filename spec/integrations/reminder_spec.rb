require 'spec_helper'

describe "Creating Reminder" do
  before { visit root_path }

  context "No user is signed in" do
    it "should link reminders to login page" do
      within "#navbar" do
        click_link "Reminders"
      end

      current_path.should == new_user_session_path
      page.should have_content "You need to sign in or sign up before continuing."
    end
  end

  context "user is signed in" do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it "should link to reminder index" do
      within "#navbar" do
        click_link "Reminders"
      end
      current_path.should == reminders_path
    end

    it "creates a new reminder" do
      visit reminders_path
      click_link "New Reminder"
      fill_in "Description", with: "Call my mother"
      fill_in "Location", with: "Home"
      select "2012", from: "reminder[date(1i)]"
      select "December", from: "reminder[date(2i)]"
      select "12", from: "reminder[date(3i)]"
      click_button "Save"

      current_path.should == reminder_path(Reminder.last)
      page.should have_content "Call my mother"
      page.should have_content "Home"
      page.should have_content "12/12/2012"
    end
  end
end
