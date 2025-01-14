class Api::V1::ProductsController < ApplicationController
  before_action :load_product, only: %i[show update destroy]

  def index
    @products = Product.all

    render json: @products
  end

  def show
    if @product
      render json: @product
    else
      render json: { error: 'Product not found!' }
    end
  end

  def create
    @product = Product.new(product_params)
    save_product(@product)
  end

  def update
    save_product(@product)
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def save_product(product)
    if product.save || product.update(product_params)
      flash[:notice] = 'Product was successfully saved.'
      render json: product
    else
      render json: { error: 'There was an error saving the product!' }
    end
  end

  def load_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :price, :description)
  end
end

#curl -X GET http://localhost:3000/api/v1/products
#curl -X POST http://localhost:3000/api/v1/products -H "Content-Type: application/json" -d '{"name": "Device", "brand": "Samsung", "price": "$382.00 USD", "description": "New Device"}'
#curl -X PUT http://localhost:3000/api/v1/products/id -H "Content-Type: application/json" -d '{"name": "Galaxy Buds3 Pro"}'
#curl -X DELETE http://localhost:3000/api/v1/products/id
