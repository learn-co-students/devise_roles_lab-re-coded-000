class UsersController < ApplicationController
	include AbstractController::Callbacks
	before_action :return_user_obj ,except: [:index]
	before_action :authenticate_user! , except: [:create, :new,:index]
	before_action :access_denied ,only:[:show]
	#load_and_authorize_resource only: [:show]
	
	def index
		@users=User.all
	end
	def edit
		
	end
	def update
		
	end
	def show

	end
    def destroy
	  	
	  	#raise params.inspect
	  	@user.destroy if current_user.role=="admin" 
	  	return head(:forbidden) if  current_user.role !="vip" || @user != current_user
	  	
	  	redirect_to("/")
    end
    private
     def return_user_obj
     	@user=User.find(params[:id])
     end
     def access_denied
      redirect_to users_path, :alert => "Access denied." if @user != current_user
          
     end
end
