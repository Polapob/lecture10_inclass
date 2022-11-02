class ShopController < ApplicationController
  def main
    @logged_in = session[:logged_in]
    @uid = session[:user_id]
    @vendor_id = params[:id]
    @items = Item.where(user_id: @vendor_id)
  end
end
