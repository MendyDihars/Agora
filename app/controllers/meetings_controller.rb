class MeetingsController < ApplicationController
  before_action  :set_meeting, only: [:show, :change_status, :validate]

  def index
    @meetings_studend = current_user.meetings_student
    @meetings_teacher = current_user.meetings_teacher
  end

  def show
  end

  def create
    @teacher = User.find(params[:teacher_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.student = current_user
    @meeting.teacher = @teacher
    if @meeting.save
      flash[:notice] = "Meeting request sent"
      redirect_to meetings_path
    else
      render 'teachers/show'
    end
  end

  def validate
    @meeting.validate_at = Time.current
    @meeting.student.mendie.balance -= 1
    @meeting.student.mendie.save
    @meeting.teacher.mendie.balance += 1
    @meeting.teacher.mendie.save
    @meeting.save
    redirect_to meeting_path(@meeting)
  end

  def change_status
    if params[:commit] == "Confirm"
      @meeting.approved_at = Date.today
      @meeting.approved_message = approved_message_params
      @meeting.save
      flash[:notice] = "Meeting approved !"
      redirect_to meetings_path
    elsif params[:commit] == "Reject"
      @meeting.rejected_at = Date.today
      @meeting.approved_message = approved_message_params
      @meeting.save
      flash[:alert] = "Meeting rejected !"
      redirect_to meetings_path
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:skill_id, :happen_at, :message)
  end

  def approved_message_params
    params[:change_status][:approved_message]
  end
end
