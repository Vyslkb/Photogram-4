require 'rails_helper'

feature 'Deleting posts' do

	background do
		user = create(:user)
		post = create(:post, caption: "Yolo!")
		visit '/'
		click_link 'Login'
		fill_in "Email", with: "markym@ark.com"
		fill_in "Password", with: "yolobro"
		click_button "Log in"
		find(:xpath, "//a[contains(@href, 'posts/1')]").click
		click_link "Edit Post"
	end

	scenario 'can delete a post' do
		click_link "Delete Post"

		expect(page).to have_content("Post has been deleted.")
		expect(page).to_not have_content("Yolo!")
	end

end