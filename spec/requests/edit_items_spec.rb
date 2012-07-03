require 'spec_helper'

describe "Edit item" do
  describe "GET /items/:id/edit" do
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

    it "should update data after submit" do
      within("fieldset") do
        fill_in "I lent", with: "Bruno"
        fill_in "my", with: "iPad"
        click_button('Update Item')
      end

      current_path.should == items_path

      updated_item = Item.find(item)
      updated_item.borrower.should == "Bruno"
      updated_item.title.should == "iPad"
    end
  end
end
