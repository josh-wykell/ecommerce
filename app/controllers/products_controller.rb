class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy,]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)

    respond_to do |format|
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.' 
      else
        render :new 
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.' 
      else
        render :edit 
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      redirect_to products_url, notice: 'Product was successfully destroyed.' 
    end
  end

  private
  
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :picture)
  end
end
