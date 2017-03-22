require 'rails_helper'

feature 'User Authentication' do

	background do
		user = create(:user)
	end

	scenario 'can log in from the index via the dynamic navbar' do
		visit "/"
		expect(page).to_not have_content("New Post")

		click_link "Login"
		fill_in "Email", with: "markym@ark.com"
		fill_in "Password", with: "yolobro"
		click_button "Log in"

		expect(page).to have_content("Signed in successfully.")
		expect(page).to_not have_content("Register")
		expect(page).to have_content("Logout")
	end  
	
	scenario 'can log out once logged in' do
		visit "/"
		click_link "Login"
		fill_in "Email", with: "markym@ark.com"
		fill_in "Password", with: "yolobro"
		click_button "Log in"
		click_link "Logout"
		expect(page).to have_content("Signed out successfully.")
	end

end