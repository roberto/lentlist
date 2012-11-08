require 'spec_helper'

describe "Edit item" do
  let(:item) { FactoryGirl.create(:item) }

  before do
    visit edit_item_path(item)
  end

  it "should load current data" do
    within("fieldset") do
      page.should have_field("I lent"), with: item.borrower
      page.should have_field("my"), with: item.title
    end
  end

  context "submitting valid item" do
    before do
      within("fieldset") do
        fill_in "I lent", with: "Bruno"
        fill_in "my", with: "iPad"
        click_button('Update Item')
      end
    end

    it "should redirect to items list" do
      current_path.should == items_path
    end

    it "should update data after submit" do
      updated_item = Item.find(item)
      updated_item.borrower.name.should == "Bruno"
      updated_item.title.should == "iPad"
    end

    it "should info user about the success" do
      find(".alert").should have_content("Item updated successfully.")
    end
  end

  context "submitting invalid item" do
    before do
      within("fieldset") do
        fill_in "I lent", with: "David"
        fill_in "my", with: ""
        click_button('Update Item')
      end
    end

    it "should stay on the edit page" do
      find("legend").should have_content("Edit Item")
    end

    it "should alert user about the error" do
      find(".alert").should have_content("The item could not be updated.")
    end

    it "should not update data after submit" do
      reloaded_item = Item.find(item)
      reloaded_item.borrower.should == item.borrower
      reloaded_item.title.should == item.title
    end
  end
end
