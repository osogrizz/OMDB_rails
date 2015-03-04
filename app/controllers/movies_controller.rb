class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    # respond_to do |format|
    # format.html # index.html.erb
    # format.xml  { render :xml => @movies }
    # format.json { render :json => @movies }
     
    # end
  end

  def new
  end

  def show
    @title
  end

  def edit
  end

  def create 
    @movie = Movie.new movie_params
    response = Typhoeus.get("www.omdbapi.com", :params => {:t => @movie.title})
    stuff = JSON.parse(response.body)
    @title = stuff["Title"]
    @date = stuff["Released"]
    # binding.pry
    render :show

  end

  private 
  def movie_params
    params.require(:movie).permit(:title)
  end
  

end
