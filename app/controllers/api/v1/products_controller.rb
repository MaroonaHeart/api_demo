class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])

    if @product
      render json: @product
    else
      render json: { error: 'Product not found!' }
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: { error: 'Error creating review!' }
    end
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.update(product_params)
    render json: @product
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :price, :description)
  end
end

#curl -X GET http://localhost:3000/api/v1/products
#curl -X POST http://localhost:3000/api/v1/products -H "Content-Type: application/json" -d '{"name": "Device", "brand": "Samsung", "price": "$382.00 USD", "description": "New Device"}'
#curl -X PUT http://localhost:3000/api/v1/products/id -H "Content-Type: application/json" -d '{"name": "Galaxy Buds3 Pro"}'
#curl -X DELETE http://localhost:3000/api/v1/products/id
