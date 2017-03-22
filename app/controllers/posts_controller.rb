class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Your post has been created."
			redirect_to @post
		else
			flash[:alert] = "Image Required"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post Updated"
			redirect_to(post_path(@post))
		else
			flash.now[:alert] = "Update failed. Please check the form"
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post has been deleted."
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:caption, :image)
	end
	
	def set_post
		@post = Post.find(params[:id])
	end

end
