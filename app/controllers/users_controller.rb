class UsersController < ApplicationController

  def index 
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
	  flash[:success] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
  end

  # DELETE /users/1
  def destroy
    @user = User.destroy(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
