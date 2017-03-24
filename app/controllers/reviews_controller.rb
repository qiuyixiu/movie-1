class ReviewsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @imovie = Imovie.find(params[:imovie_id])
    @review = Review.new
  end

  def create
    @imovie = Imovie.find(params[:imovie_id])
    @review = Review.new(review_params)
    @review.imovie = @imovie
    @review.user = current_user

    if @review.save
      redirect_to imovie_path(@imovie)
    else
      render :new
    end
  end 

    private

    def review_params
      params.require(:review).permit(:内容)
    end

end
