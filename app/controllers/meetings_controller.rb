class MeetingsController < ApplicationController

  def index
    @meetings_studend = current_user.meetings_student
    @meetings_teacher = current_user.meetings_teacher
  end

  def create
    @teacher = User.find(params[:teacher_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.student = current_user
    @meeting.teacher = @teacher
    if @meeting.save
      redirect_to meetings_path
    else
      render 'teachers/show'
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:skill_id, :happen_at, :message)
  end
end
