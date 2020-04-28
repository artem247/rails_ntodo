class UsersController < ApplicationController
  before_action :logged_in_user, only: :show 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @todo_lists = @user.todo_lists

  end



  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end


end
