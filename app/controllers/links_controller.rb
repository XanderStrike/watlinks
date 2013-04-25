class LinksController < ApplicationController
	def index
		@posts = Post.where(board: "links").sort_by(&:created_at).reverse
    @board = "Links"
    render 'posts/index'
	end

	def show
		@board = "Links"
		@category = params[:id]
		@posts = Post.where(board: "links", category: @category).sort_by(&:created_at).reverse

		render 'posts/index'
	end
end