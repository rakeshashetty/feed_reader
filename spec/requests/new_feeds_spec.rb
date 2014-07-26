require 'spec_helper'

describe "NewFeeds" do
  describe "GET /new" do
    it "shows the list of recent feeds after creating with valid feed url" do     
      feed = build(:feed)
      visit root_path
      click_link "New Feed"

      fill_in "Name", :with => feed.name
      click_button "Create Feed"
      page.should have_content("Feed was successfully created.")
    end
  end
end
