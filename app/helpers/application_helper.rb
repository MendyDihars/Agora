module ApplicationHelper
  def emoji(name)
    case name
      when 'Code' then "⌨ #{name}"
      when 'Webdesign' then "⌨ #{name}"
      when 'Dance' then "💃 #{name}"
      when 'Handyman' then "🔧 #{name}"
      when 'Mechanics' then "🔧 #{name}"
      when 'Guitar' then "🎸 #{name}"
      when 'Karate' then "👊 #{name}"
      when 'Painting' then "🖌 #{name}"
    end
  end

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
