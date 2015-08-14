class StaticPagesController < ApplicationController
  def home
	  @title = t(:home)
	  @books_count = Book.count
  end

  def about
	  @title = t(:about)
  end
end
