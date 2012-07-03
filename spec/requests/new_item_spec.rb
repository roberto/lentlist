require 'spec_helper'

describe "New item" do
  describe "GET /items/new" do

    before do
      visit new_item_path
    end

    it "should load current data" do
      within("fieldset") do
        page.should have_selector(:xpath, "//input[@placeholder='John']")
        page.should have_selector(:xpath, "//input[@placeholder='Cookbook']")
      end
    end

    it "should create item after submit" do
      within("fieldset") do
        fill_in "I lent", with: "Davis"
        fill_in "my", with: "Kindle"
        click_button('Create Item')
      end

      current_path.should == items_path
      
      updated_item = Item.last
      updated_item.borrower.should == "Davis"
      updated_item.title.should == "Kindle"
    end
  end
end
