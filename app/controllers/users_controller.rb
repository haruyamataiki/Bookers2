class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit]}
  def index
      @users = User.all
      ##@books=Book.all
      @bookn = Book.new
      @user = User.find(current_user.id)
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
    @bookn = Book.new
  end

  def new
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
      end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(user_params)
      redirect_to user_path(@user.id),notice:"successfully"
    else
      redirect_to user_path(current_user.id),notice:"error"
    end
end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end