class ShopController < ApplicationController

  skip_before_action :validate, only: [:main]

  def main
    @logged_in = session[:logged_in]
    @uid = session[:user_id]
    @vendor_id = params[:id]
    @items = Item.where(user_id: @vendor_id).where("stock > ?", 0)
  end

  def buy
    @vendor_id = params[:vendor_id]
    @item_id = params[:item_id]
    @user_id = session[:user_id]
    @item = Item.find(@item_id)
    if @item.stock > 0
      @item.stock = @item.stock - 1
      @item.save
    end
    Inventory.create(user_id:@user_id,item_id:@item.id,price:@item.price,timestamp:Time.now.strftime("%Y-%d-%m %H:%M:%S %Z"))
    redirect_to "/shop/"+@vendor_id
  end
end