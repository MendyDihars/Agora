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
      asset_path 'avatar-nobody'
    end
  end



end
