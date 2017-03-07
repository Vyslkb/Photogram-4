require 'rails_helper'

feature 'Creating posts' do
	scenario 'can create a post' do
		visit '/'
		click_link 'New Post'
		attach_file('Image', "spec/files/images/coffee.jpeg")
		fill_in 'Caption', with: "nom nom nom #coffeetime"
		click_button 'Create Post'
		expect(page).to have_content("#coffeetime")
		expect(page).to have_css("img[src*='coffee.jpeg']")
	end

	scenario 'does not create a post' do
		visit '/'
		click_link 'New Post'
		fill_in 'Caption', with: "literally, just YOLO"
		click_button 'Create Post'
		expect(page).to have_content("Image Required")
	end
end