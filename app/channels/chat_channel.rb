class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:meeting_room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
