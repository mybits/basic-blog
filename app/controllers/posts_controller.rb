class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post, notice: 'Post was successfully created.'
		else
			render action: 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post, notice: 'Post was successfully updated.'
		else
			render action: 'edit'
		end
	end



	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
