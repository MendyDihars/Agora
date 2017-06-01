
module ApplicationHelper

  def status(approved, rejected)
    if approved != nil
      "<p class='status-approved'>Approved</p>"
    elsif rejected != nil
      "<p class='status-rejected'>Rejected</p>"
    else
      "<p class='status-pending'>Pending</p>"
    end
  end

  def dynamic_avatar user
    if user.photo?
      ActionController::Base.helpers.cl_image_path user.photo.path
    else
      image_path 'avatar-nobody'
    end
  end

  def dont_forget(meeting)
    unless meeting.validate? && current_user == meeting.student
      "Don't forget to validate your meeting, here"
    else
      "View details"
    end
  end


end
