class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
     layout "index", only: [:index]

  def index
    @teachers = User.all
    @skill = search_params[:user_skill]
    @address = search_params[:address]

    if search_params[:user_skill].present?
      @teachers = User.joins(:user_skills).where(user_skills:
        { skill_id: Skill.find_by("name =  ?", search_params[:user_skill].capitalize) }
      )
    end

    if search_params[:address].present?
      @teachers = @teachers.near(search_params[:address])
    end

    @teachers = @teachers.where.not(latitude: nil, longitude: nil)
  end

  def show
    @teacher = User.find(params[:id])
    @review = Review.new
    @reviews = @teacher.reviews_received.sort_by { |review| review.created_at }.reverse
    @meeting = Meeting.where(teacher: @teacher, student: current_user).order(happen_at: :desc).first
  end

  private

  def search_params
    params.require(:index).permit(:user_skill, :address)
  end

end
