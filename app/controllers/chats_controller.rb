class ChatsController < ApplicationController

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @chats = @meeting.chats
    @chat = Chat.new(require_params)
    @chat.meeting = @meeting
    @chat.user = current_user
    if @chat.save
      ActionCable.server.broadcast("meeting_#{@meeting.id}",
        content: @chat.content,
        user: @chat.user.id
     )
     head :ok
    else
      render 'meetings/show'
    end
  end

  private

  def require_params
    params.require(:chat).permit(:content)
  end
end
