class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  private
  def rescue_not_found
    respond_to do |format|
     format.html { render file: "#{Rails.root}/public/404", status: 404, layout: false}
    end
    true
  end
  
end
