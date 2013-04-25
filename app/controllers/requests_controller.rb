class RequestsController < ApplicationController
	def index
		@board = "requests"
    @posts = Post.where(board: @board).sort_by(&:created_at).reverse
    
    render 'posts/index'
	end

	def show
		@board = "requests"
		@category = params[:id]
		@posts = Post.where(board: @board, category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end

	def new
		@board = "requests"
		@category = params[:in]
		@post = Post.new

		render 'posts/new'
	end
end