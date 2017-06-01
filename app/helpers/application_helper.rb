
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
      'http://res.cloudinary.com/mendyd/image/upload/v1496330256/avatar-nobody_cptbv8.png'
    end
  end

  def dont_forget(meeting)
    if current_user.can_validate?(meeting)
      "Don't forget to validate your meeting, here"
    else
      "Arrange meeting details"
    end
  end


end
