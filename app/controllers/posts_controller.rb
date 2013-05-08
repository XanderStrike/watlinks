class PostsController < ApplicationController
  before_filter :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    @message = "Clever girl..."
    @board = "All posts"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

    unless params[:score].blank?
      if @post.users_voted.split(",").include?(current_user.id.to_s)
        redirect_to "/posts/#{@post.id}"
        return
      else
        if params[:score] == "plus"
          @post.score += 1
        elsif params[:score] == "minus"
          @post.score -= 1
        else
          redirect_to "/posts/#{@post.id}"
          return        
        end
      end

      @post.users_voted += ",#{current_user.id}"
      @post.save

      redirect_to "/posts/#{@post.id}"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    @post.user = current_user
    @post.board = params[:board] unless params[:board].blank?
    @post.category = params[:category] unless params[:category].blank?
    @post.users_voted = "#{current_user.id}"
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    board = @post.board
    @post.destroy

    respond_to do |format|
      format.html { redirect_to "/#{board}" }
      format.json { head :no_content }
    end
  end
end
