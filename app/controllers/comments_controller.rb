class CommentsController < ApplicationController

	http_basic_authenticate_with name: 'me', password: 'onrails', only: :destroy

	before_action :set_post

	def create
		@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
		redirect_to post_path(@post)
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def set_post
			@post = Post.find(params[:post_id])
		end
end
