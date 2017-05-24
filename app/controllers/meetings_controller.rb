class MeetingsController < ApplicationController
  def create
    @teacher = User.find(params[:teacher_id])
    @meeting = @teacher.meetings.new(meeting_params)
    @meeting.student = current.user
    @meeting.save
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_skill, :happen_at, :message)
  end
end
