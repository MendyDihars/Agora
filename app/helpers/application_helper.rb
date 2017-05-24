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
end
