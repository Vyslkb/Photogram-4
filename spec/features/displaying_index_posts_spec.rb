require 'rails_helper'

feature 'Index displays a list of posts' do
	scenario 'the index display correct created post information' do
		post_one = create(:post, caption: "This is post one") #factory_girl?
		post_two = create(:post, caption: "This is the second post") #factory_girl? 
  
		visit '/'
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end