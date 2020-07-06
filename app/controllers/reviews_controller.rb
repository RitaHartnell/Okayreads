class ReviewsController < ApplicationController
    def show
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.save
        redirect_to review_path(@review)
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    private

    def review_params
        params.require(:review).permit(:title, :user_id, :book_id, :content, :rating)
    end
end
