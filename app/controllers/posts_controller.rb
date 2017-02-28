class PostsController < ApplicationController
  before_action :find_post! ,except: [:index]
  before_action :authenticate_user!
  load_and_authorize_resource only: [:edit, :show, :update,:create,:new]
  
  def index 
  @posts=Post.all 
  end
  def create
    Post.create(content: params[:post][:content],user_id: current_user.id)
  end

  def edit  
  end

  def update
    @post.update(content: params[:post][:content])
    redirect_to("posts/")
  end
  private
     def find_post!
      @post=Post.find(params[:id])
     end
end