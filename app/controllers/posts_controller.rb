class PostsController < ApplicationController
	before_action :return_post_obj ,except: [:index]
	before_action :authenticate_user!
	load_and_authorize_resource only: [:edit, :show, :update,:create,:new]
	def index
		
	end
	def edit
		
	end

	def update
		@post.update(content: params[:post][:content])
		redirect_to("posts/")
	end
	private
     def return_post_obj
     	@post=Post.find(params[:id])
     end
end
