class Api::V1::CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)

    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end
