require 'spec_helper'

describe "New item" do
  before do
    visit new_item_path
  end

  it "should set placeholders" do
    within("fieldset") do
      page.should have_selector(:xpath, "//input[@placeholder='John']")
      page.should have_selector(:xpath, "//input[@placeholder='Cookbook']")
    end
  end


  context "submitting valid item" do
    before do
      within("fieldset") do
        fill_in "I lent", with: "Davis"
        fill_in "my", with: "Kindle"
        click_button('Create Item')
      end
    end

    it "should redirect to items list" do
      current_path.should == items_path
    end

    it "should create item after submit" do
      updated_item = Item.last
      updated_item.borrower.name.should == "Davis"
      updated_item.title.should == "Kindle"
    end
  end

  context "submitting invalid item" do
    before do
      Item.delete_all
      within("fieldset") do
        fill_in "I lent", with: "Davis"
        fill_in "my", with: ""
        click_button('Create Item')
      end
    end

    it "should stay on new item page" do
      find("legend").should have_content("New Item")
    end

    it "should alert user about error" do
      find('.alert').should have_content("The item could not be created.")
    end

    it "should create item after submit" do
      Item.last.should be_nil
    end
  end
end
