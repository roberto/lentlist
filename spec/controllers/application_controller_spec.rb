require 'spec_helper'

describe ApplicationController do

  describe "rescue_not_found" do
    context "when action raises record not found" do
      controller do
        def index
          raise ActiveRecord::RecordNotFound
        end
      end

      it "redirects to 404 page" do
        controller.should_receive(:render).with(file: "#{Rails.root}/public/404", status: 404, layout: false)
        get :index
      end
    end

    context "when action doesn't raise record not found" do
      controller do
        def index
        end
      end

      it "doesn't redirect to 404 page" do
        controller.should_not_receive(:render).with(file: "#{Rails.root}/public/404", status: 404, layout: false)
        get :index
      end
    end

  end
end
