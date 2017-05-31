class ChatsController < ApplicationController

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @chats = @meeting.chats
    @chat = Chat.new(require_params)
    @chat.meeting = @meeting
    @chat.user = current_user
    if @chat.save
      ActionCable.server.broadcast("meeting_#{@meeting.id}",
        sender_content: "ici partial if its me",
        receiver_content: "ici partial si cé pa moa"
        sender_id: current_user.id
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
