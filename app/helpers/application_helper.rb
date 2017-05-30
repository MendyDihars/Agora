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
end
