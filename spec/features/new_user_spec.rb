require 'rails_helper'

feature "Creating a new user" do

	background do
		visit '/'
		click_link "Register"
	end

	scenario "can create a new user via the index page" do
		fill_in "User name", with: "Johnny Bravo"
		fill_in "Email", with: "johnny@bravo.com"
		fill_in "Password", with: "supersecret"
		fill_in "Password Confirmation", with: "supersecret", match: :first
		click_button "Sign Up"
		expect(page).to have_content("Welcome! You have signed up successfully.")
	end


end

