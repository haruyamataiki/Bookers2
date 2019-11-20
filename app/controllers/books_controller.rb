class BooksController < ApplicationController
        before_action :authenticate_user!
        before_action :ensure_correct_user, {only: [:edit]}
    def index
    	@books=Book.all
  		@bookn = Book.new
        # @user = User.find(current_user.id)
        @user = current_user
        ##bookn
    end

    def show
    	@book = Book.find(params[:id])
        @bookn = Book.new
       ##bookn
        @user = @book.user
    end

    def new
    end

    def create
    	book = Book.new(book_params)
        book.user_id = current_user.id
    	if  book.save
            redirect_to book_path(book.id),notice:"successfully"
        else
         flash[:notice] = "error"
    	   redirect_to books_path
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def ensure_correct_user
     @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
  end
    end

    def edit
        @book = Book.find(params[:id])

    end

     def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id),notice:"successfully"
        else
          flash[:notice] = "error"
            render :edit

        end
    end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  #   def user_params
  #   params.require(:user).permit(:name, :introduction, :profile_image)
  # end

end