class ForumsController < ApplicationController
	def index
		@posts = Post.where(board: "forums").sort_by(&:created_at).reverse
    @board = "Forums"
    render 'posts/index'
	end

	def show
		@board = "Forums"
		@category = params[:id]
		@posts = Post.where(board: "forums", category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end
end