require 'rails_helper'

RSpec.describe "PostAPictures", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "user can post some text and see it displayed" do
    visit "/"
    click_on "Sign up"
    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    fill_in "user_password_confirmation", with: DEFAULT_PASSWORD
    click_button "Sign up"

    find("#new_post").click
    fill_in "post_title", with: "Writing a post"
    click_button "Create Post"
    expect(page).to have_content "Writing a post"
  end

  it "user can post an image and see it displayed" do
    visit "/"
    click_on "Sign up"
    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    fill_in "user_password_confirmation", with: DEFAULT_PASSWORD
    click_button "Sign up"

    find("#new_post").click
    attach_file("post_image", Rails.root + "spec/support/test_image.jpg")
    click_button "Create Post"
    expect(page).to have_css("img[src*='test_image.jpg']")

      # <img src="http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--be9ae6dfb9eadf1c5cd4fff2fa4dbe3c17c488f8/ruby.jpg">
  end


end
