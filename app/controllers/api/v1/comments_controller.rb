class Api::V1::CommentsController < ApplicationController
  before_action :load_product
  before_action :load_comment, only: %i[show update destroy]

  def index
    @comments = @product.comments

    render json: @comments
  end

  def show
    if @comment
      render json: @comment
    else
      render json: { error: 'Comment not found!' }
    end
  end

  def create
    @comment = @product.comments.build(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { error: 'There was an error saving the comment!' }
    end
  end

  def update
    @comment.update(comment_params)

    render json: @comment
  end

  def destroy
    @comment.destroy
  end

  private

  def load_comment
    @comment = @product.comments.find_by(id: params[:id])
  end

  def load_product
    @product = Product.find_by(id: params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end

#curl -X GET http://localhost:3000/api/v1/products/id/comments
#curl -X POST http://localhost:3000/api/v1/products/id/comments -H "Content-Type: application/json" -d '{"title": "Fairy", "message": "fairy tale"}'
#curl -X PUT http://localhost:3000/api/v1/products/id/comments/id -H "Content-Type: application/json" -d '{"message": "unicorn my love"}'
#curl -X DELETE http://localhost:3000/api/v1/products/id/comments/id