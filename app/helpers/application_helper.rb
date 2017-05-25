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
      "<p class='btn btn-success btn-xs'>Approved</p>"
    elsif rejected != nil
      "<p class='btn btn-danger btn-xs'>Rejected</p>"
    else
      "<p class='btn btn-warning btn-xs'>Pending</p>"
    end
  end
end
