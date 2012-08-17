class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      redirect_to items_path, :flash => {:success => "Item added successfully."}
    else
      flash.now[:error] = "The item could not be created."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to items_path, :flash => {:success => "Item updated successfully."}
    else
      flash.now[:error] = "The item could not be updated."
      render :edit
    end
  end


end
