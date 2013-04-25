class ForumsController < ApplicationController
	def index
    @board = "forums"
    @posts = Post.where(board: @board).sort_by(&:created_at).reverse

    render 'posts/index'
	end

	def show
		@board = "forums"
		@category = params[:id]
		@posts = Post.where(board: @board, category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end

	def new
		@board = "forums"
		@category = params[:in]
		@post = Post.new

		render 'posts/new'
	end
end