class PostsController < ApplicationController

	http_basic_authenticate_with name: 'me', password: 'onrails', except: [:index, :show] 

	before_action :set_post, only: [:show, :edit, :update, :destroy]

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
	end

	def edit
	end

	def update
		
		if @post.update(post_params)
			redirect_to @post, notice: 'Post was successfully updated.'
		else
			render action: 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice: 'Post was successfully deleted.'
	end



	private
		def set_post
			@post = Post.find(params[:id])
		end
			
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
