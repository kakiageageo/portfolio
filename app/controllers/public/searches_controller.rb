class Public::SearchesController < ApplicationController

  #ジャンル名からジャンルを検索
  def genre_search
    @name = params[:word]
    @genres = Genre.where("name LIKE?","%#{@name}%")
    render 'genre_result'
  end
  
  #ジャンル名から本を検索
   def book_genre_search
    @name = params[:word]
    genres = Genre.where("name LIKE?",@name)
    @books = Book.where(id:BookGenre.where(genre_id:genres.pluck(:id)).pluck(:book_id))
    render 'book_genre_result'
  end

end
