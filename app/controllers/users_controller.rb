class UsersController < ApplicationController
  include AbstractController::Callbacks
  before_action :find_user! ,except: [:index]
  before_action :authenticate_user! , except: [:create, :new,:index]
  before_action :access_denied ,only:[:show]

  
  def index
    @users=User.all
  end

  def edit 
  @user = User.find(params[:id]) 
  end

  def update 
  end

  def show
  end

  def destroy
    @user.destroy if current_user.admin? 
    return head(:forbidden) if  !current_user.vip? || @user != current_user
    redirect_to("/")
  end


  private
  def find_user!
    @user=User.find_by_id(params[:id])
  end
  def access_denied
    redirect_to users_path, :alert => "Access denied." if @user != current_user

  end
end