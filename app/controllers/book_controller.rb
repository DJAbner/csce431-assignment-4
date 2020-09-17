class BookController < ApplicationController

def index
	@books = Book.all
end

def new
	@book = Book.new
end

def create
	@book = Book.create(params.require(:book).permit(:title, :author, :genre, :price, :published-date))
	if @book.valid?
		redirect_to books_path
	else
		flash[:errors] = @books.errors.full_messages
		redirect_to new_book_path
	end
end
def show
	@book = Book.find(params[:id])
end

def edit
	@book = Book.find(params[:id])
end

def update
	@book = Book.find(params[:id])
	@book.update(params.require(:book).permit(:title, :author, :genre, :price, :publication-date)
	redirect_to book_path(@book)
end

def destroy
	@book = Book.find(params[:id])
	@book.destroy
	redirect_to students_path
end