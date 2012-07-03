class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    #TODO add flash messages and respond_to block
    if @item.update_attributes(params[:item])
      redirect_to items_path
    else
      render :edit
    end
  end


end
