class CartController < ApplicationController
  before_filter :extract_cart

  # def create
  #   @product = Product.find(params[:product_id])
  #   @cart.add(@product, @product.price)
  #   redirect_to cart_path
  # end

  def index
    @cart = Cart.find session[:cart_id]
  end

  def show

  end

  def add
    @product = Product.find params[:product_id]
    cart_id = session[:cart_id]
    if cart_id.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    else
      cart = Cart.find cart_id
    end

    cart_item = cart.cart_items.find_by product_id: @product.id
    if cart_item.present?
      cart_item.update quantity: (cart_item.quantity + 1)
    else
      cart.cart_items.create product: @product
    end

  end

  def clear
    cart = Cart.find session[:cart_id]
    cart.update_attribute(:status, "bought")
    session[:cart_id] = nil
    redirect_to root_path
  end

  private
  def extract_cart
    cart_id = session[:cart_id]
    @cart = session[:cart_id] #? Cart.find(cart_id) : Cart.create
    #session[:cart_id] = @cart.id
  end
end