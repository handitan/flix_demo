class ReviewsController < ApplicationController

  before_action  :set_movie  

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(movie_params)
    if @movie.save
      redirect_to movie_reviews_path(@movie), notice: "Thanks for your review!"
    else
      render :new
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_reviews_path(@movie), alert: "Review successfully deleted!"
  end

  def edit
    @review = @movie.reviews.find(params[:id])
  end
  
  def update
    @review = @movie.reviews.find(params[:id])
    if @review.update(movie_params)
       redirect_to movie_reviews_path(@movie), notice: "Review successfully edited!" 
    else
      render :edit
    end
  end

  private
    
    def movie_params
      params.require(:review).permit(:name,:stars,:comment)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
