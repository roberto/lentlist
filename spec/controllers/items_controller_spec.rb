require 'spec_helper'

describe ItemsController do
  before(:all){ ActiveRecord::IdentityMap.enabled = true }
  after(:all){ ActiveRecord::IdentityMap.enabled = false }

  describe "GET #index" do
    let!(:items) { create_list(:item, 4) }

    it "populates an array of items" do
      get :index
      expect(assigns(:items)).to eq(items)
    end

    it "render the index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "handles pagination" do
      Item.expects(:page).with("4")
      get :index, page: "4"
    end
  end

  describe "GET #new" do
    it "assigns a new item" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end

    it "assigns a item with borrower" do
      get :new
      expect(assigns(:item).borrower).to be_a_new(Borrower)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    let!(:item) { create(:item) }

    it "assigns requested item" do
      get :edit, id: item
      expect(assigns(:item)).to eq item
    end

    it "renders the edit template" do
      get :edit, id: item
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "redirects to items page" do
        post :create, item: attributes_for(:item)
        expect(response).to redirect_to :items
      end

      it "sets success message" do
        post :create, item: attributes_for(:item)
        expect(flash[:success]).to eq("Item added successfully.")
      end
    end

    context "with invalid attributes" do
      it "re-renders the new template" do
        post :create, item: attributes_for(:invalid_item)
        expect(response).to render_template :new
      end
      it "sets error message" do
        post :create, item: attributes_for(:invalid_item)
        expect(flash[:error]).to eq("The item could not be created.")
      end
    end
  end

  describe "PUT #update" do
    let(:item) { create(:item) }

    it "assigns item" do
      put :update, id: item, item: attributes_for(:item)
      expect(assigns(:item)).to eq(item)
    end

    context "valid attributes" do
      it "redirects to items page" do
        put :update, id: item, item: attributes_for(:item)
        expect(response).to redirect_to :items
      end

      it "sets success message" do
        put :update, id: item, item: attributes_for(:item)
        expect(flash[:success]).to eq("Item updated successfully.")
      end
    end

    context "invalid attributes" do
      let(:item) { create(:item) }

      it "re-renders the edit template" do
        put :update, id: item, item: attributes_for(:invalid_item)
        expect(response).to render_template :edit
      end

      it "sets error message" do
        put :update, id: item, item: attributes_for(:invalid_item)
        expect(flash[:error]).to eq("The item could not be updated.")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:item) { create(:item) }

    it "destroys the item" do
      item.expects(:destroy).returns(true)
      delete :destroy, id: item
    end
    it "redirects to items page" do
      delete :destroy, id: item
      expect(response).to redirect_to :items
    end
    it "sets success message" do
      delete :destroy, id: item
      expect(flash[:success]).to be
    end
  end

end
