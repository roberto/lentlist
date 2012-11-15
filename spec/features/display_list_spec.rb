require 'spec_helper'

describe "Display items" do
  describe "GET /" do
    let!(:items) { create_list(:item_with_borrower, 5)}

    before do
      visit root_path
    end

    it "should display the current items (title and borrower)" do
      within main_table do
        items.each do |item|
          expect(page).to have_content(item.title)
          expect(page).to have_content(item.borrower.name)
        end
      end
    end

    it "should display edit, delete and archive button for each item" do
      table_rows.each do |element|
        expect(element).to have_link('Edit')
        expect(element).to have_link('Archive')
        expect(element).to have_link('Delete')
      end
    end

    it "should display a 'Add item' button" do
      expect(page).to have_link('Add item')
    end
  end
end
