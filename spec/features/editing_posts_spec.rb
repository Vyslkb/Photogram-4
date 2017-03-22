require 'rails_helper'

feature 'Editing posts' do
	background do
		user = create(:user) 
		post = create(:post, user_id: user.id )
		sign_in_with(user)
		find(:xpath, "//a[contains(@href, 'posts/1')]").click
		click_link "Edit Post"
	end

	scenario 'can edit a post' do
		fill_in "Caption", with: "Oh my geeeerd"
		click_button "Update Post"

		expect(page).to have_content("Post Updated")
		expect(page).to have_content("Oh my geeeerd")		
	end
	
end