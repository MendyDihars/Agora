class NotificationMailerPreview < ActionMailer::Preview
  def notification
    user = User.first
    StudentMailer.notification(user)
  end
end
