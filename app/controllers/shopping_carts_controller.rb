class ShoppingCartsController < ApplicationController
  before_filter :extract_shopping_cart

  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    redirect_to shopping_cart_path
  end

  def index
    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
  end

  def show

  end

  def add
    @product = Product.find params[:product_id]
    shopping_cart_id = session[:shopping_cart_id]
    if shopping_cart_id.nil?
      shopping_cart = ShoppingCart.create
      session[:shopping_cart_id] = shopping_cart.id
    else
      shoppig_cart = ShoppingCart.find shopping_cart_id
    end

    cart_item = shopping_cart.cart_items.find_by product_id: @product.id
    if cart_item.present?
      cart_item.update quantity: (cart_item.quantity + 1)
    else
      shopping_cart.cart_items.create product: @product
    end

  end

  def clear
    shopping_cart = ShoppingCart.find session[:shopping_cart_id]
    shopping_cart.update_attribute(:status, "bought")
    session[:shopping_cart_id] = nil
    redirect_to root_path
  end

  private
  def extract_shopping_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] #? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    #session[:shopping_cart_id] = @shopping_cart.id
  end
end