class ReviewsController < ApplicationController

  def create
    @teacher = User.find(params[:teacher_id])
    @review = Review.new(review_params)
    @review.teacher = @teacher
    @review.student = current_user
    if @review.save
      redirect_to teacher_path(@teacher)
    else
      render "teachers/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
