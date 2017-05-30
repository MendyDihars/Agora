class ChatsController < ApplicationController

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @chat = Chat.new(require_params)
    @chat.meeting = @meeting
    @chat.user = current_user
    if @chat.save
      redirect_to meeting_path(@meeting)
    else
      render 'meetings/show'
    end
  end

  private

  def require_params
    params.require(:chat).permit(:content)
  end
end
