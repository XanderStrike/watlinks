class RequestsController < ApplicationController
	def index
		@posts = Post.where(board: "requests").sort_by(&:created_at).reverse
    @board = "Requests"
    render 'posts/index'
	end

	def show
		@board = "Requests"
		@category = params[:id]
		@posts = Post.where(board: "requests", category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end
end