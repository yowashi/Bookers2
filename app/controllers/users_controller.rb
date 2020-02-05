class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

	def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "error"
      render 'edit'
    end
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end

	def user_params
		params.require(:user).permit(:user_id, :name, :profile_image, :introduction)
	end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
