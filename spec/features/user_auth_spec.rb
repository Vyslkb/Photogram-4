require 'rails_helper'

feature 'User Authentication' do

	background do
		user = create(:user, email: "yolo@yolo.com", user_name: "yoloboi", password: "yolo_passoword" , id: 1)
	end

	scenario 'can log in from the index via the dynamic navbar' do
		visit "/"
		expect(page).to_not have_content("New Post")

		click_link "Login"
		fill_in "Email", with: "yolo@yolo.com"
		fill_in "Password", with: "yolo_passoword"
		click_button "Log in"

		expect(page).to have_content("Signed in successfully.")
		expect(page).to_not have_content("Register")
		expect(page).to have_content("Logout")

	end  

end