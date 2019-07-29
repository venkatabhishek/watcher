class AppController < ApplicationController
	include Movie

  def index

    @genres = genres
    @movies = popular
  end

end
