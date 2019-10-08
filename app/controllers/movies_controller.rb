class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.get_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || @all_ratings
    @sort_by = params[:sort_by] || session[:sort_by]
    
    session[:ratings] = @selected_ratings
    session[:sort_by] = @sort_by

    @movies = Movie.with_ratings(@selected_ratings.keys)
    @movies = @movies.order(@sort_by)

    if params[:ratings] != session[:ratings] or params[:sort_by] != session[:sort_by]
      flash.keep
      redirect_to movies_path sort_by: @sort_by, ratings: @selected_ratings
    end

    if params[:sort_by] == 'title' then @title_header = 'hilite' end
    if params[:sort_by] == 'release_date' then @release_date_header = 'hilite' end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end