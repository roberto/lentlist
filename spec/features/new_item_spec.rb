require 'spec_helper'

describe "New item" do
  before do
    visit new_item_path
  end

  it "should set placeholders" do
    within("fieldset") do
      expect(page).to have_selector(:xpath, "//input[@placeholder='John']")
      expect(page).to have_selector(:xpath, "//input[@placeholder='Cookbook']")
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
      expect(current_path).to eql(items_path)
    end

    it "should create item after submit" do
      updated_item = Item.last
      expect(updated_item.borrower.name).to eql("Davis")
      expect(updated_item.title).to eql("Kindle")
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
      expect(find("legend")).to have_content("New Item")
    end

    it "should alert user about error" do
      expect(find('.alert')).to have_content("The item could not be created.")
    end

    it "should create item after submit" do
      expect(Item.last).to be_nil
    end
  end
end
