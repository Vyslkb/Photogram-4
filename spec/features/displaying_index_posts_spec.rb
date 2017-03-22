require 'rails_helper'

feature 'Index displays a list of posts' do
		background do
			user = create(:user)
			post_one = create(:post, caption: "This is post one")
			post_two = create(:post, caption: "This is the second post")
			visit "/"
			fill_in "Email", with: user.email
			fill_in "Password", with: user.password
			click_button "Log in"
		end

	scenario 'the index display correct created post information' do  
		visit '/'
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end