require 'spec_helper'

describe "Edit item" do
  let(:item) { create(:item) }

  before do
    visit edit_item_path(item)
  end

  it "should load current data" do
    within("fieldset") do
      expect(page).to have_field("I lent", with: item.borrower.name)
      expect(page).to have_field("my", with: item.title)
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
      expect(current_path).to eql(items_path)
    end

    it "should update data after submit" do
      updated_item = Item.find(item)
      expect(updated_item.borrower.name).to eql("Bruno")
      expect(updated_item.title).to eql("iPad")
    end

    it "should info user about the success" do
      expect(find(".alert")).to have_content("Item updated successfully.")
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
      expect(find("legend")).to have_content("Edit Item")
    end

    it "should alert user about the error" do
      expect(find(".alert")).to have_content("The item could not be updated.")
    end

    it "should not update data after submit" do
      reloaded_item = Item.find(item)
      expect(reloaded_item.borrower).to eql(item.borrower)
      expect(reloaded_item.title).to eql(item.title)
    end
  end
end
