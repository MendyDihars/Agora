class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:meeting_room]
  end
end
