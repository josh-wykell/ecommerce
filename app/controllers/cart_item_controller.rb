class CartItemController < ApplicationController
  def edit
    @cart_item = CartItem.find params[:cart_item_id]
  end

  def update
    @cart_item = CartItem.find params[:cart_item_id]
    @cart_item.update quantity: params[:quantity]
  end
end
