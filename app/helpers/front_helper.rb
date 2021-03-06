module FrontHelper
  def render_type(e)
    if e.event_type == "itemLoot" or e.event_type == "itemCraft"
      content_tag(:a, '', href: "http://www.wowhead.com/item=#{e.itemId}")
    elsif e.event_type == "playerAchievement" or e.event_type="guildAchievement"
      content_tag(:a, '', href: "http://wotlk.wowhead.com/achievement=#{e.achievementId}")
    else
      e.event_type
    end
  end

  def render_log_link
    content_tag(:a, 'View Logs', href: "https://www.warcraftlogs.com/guilds/usercalendar/197620")
  end

  def guild_name
    Rails.application.config.guild_name
  end

  def realm
    Rails.application.config.realm
  end

  def allegiance
    g = Guild.find_by(name: Rails.application.config.guild_name)
    if g != nil && g.side == 1
      content_tag(:div, 'Horde Guild', class: "guild-side horde")
    else
      content_tag(:div, 'Aliiance Guild', class: "guild-side alliance")
    end
  end

end
