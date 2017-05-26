class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

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
    @reviews = @teacher.reviews_received.sort_by { |review| review.created_at }.reverse
    meeting = Meeting.find_by_teacher_id(@teacher)
    if meeting.present? && meeting.student == current_user && meeting.approved_at.present? && meeting.happen_at < Date.today
      @is_authorized = true
    else
      @is_authorized = false
    end
  end

  private

  def search_params
    params.require(:index).permit(:user_skill, :address)
  end

end
