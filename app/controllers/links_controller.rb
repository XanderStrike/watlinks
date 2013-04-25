class LinksController < ApplicationController
	def index
    @board = "links"
    @posts = Post.where(board: @board).sort_by(&:created_at).reverse
    
    render 'posts/index'
	end

	def show
		@board = "links"
		@category = params[:id]
		@posts = Post.where(board: @board, category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end

	def new
		@board = "links"
		@category = params[:in]
		@post = Post.new

		render 'posts/new'
	end
end