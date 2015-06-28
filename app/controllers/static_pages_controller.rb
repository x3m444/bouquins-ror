class StaticPagesController < ApplicationController
  def home
	  @title = "Home"
	  @books_count = Calibre::Book.count
  end

  def about
	  @title = "About"
  end
end
