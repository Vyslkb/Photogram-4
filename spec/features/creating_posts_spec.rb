require 'rails_helper'

feature 'Creating posts' do

	background do 
		user = create(:user)
		visit '/'
		click_link 'Login'
		fill_in "Email", with: "markym@ark.com"
		fill_in "Password", with: "yolobro"
		click_button "Log in"
		click_link 'New Post'
	end

	scenario 'can create a post' do
		attach_file('Image', "spec/files/images/coffee.jpg")
		fill_in 'Caption', with: "nom nom nom #coffeetime"
		click_button 'Create Post'
		expect(page).to have_content("#coffeetime")
		expect(page).to have_css("img[src*='coffee.jpg']")
	end

	scenario 'does not create a post' do
		fill_in 'Caption', with: "literally, just YOLO"
		click_button 'Create Post'
		expect(page).to have_content("Image Required")
	end
end