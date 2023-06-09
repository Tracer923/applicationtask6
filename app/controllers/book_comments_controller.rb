class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @books = Book.all
    @user = @book.user
    @book_comment = BookComment.new
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      render :comments
    else
      render 'books/show'
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    @comment = BookComment.find_by(id: params[:id], book_id: book.id)
    @comment.destroy
    @book = Book.find(params[:book_id])
    render :comments
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
