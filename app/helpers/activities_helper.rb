module ActivitiesHelper

  # Helper methods for displaying information related to PublicActivity::Activities

  def render_activity_icon action
    case
      when action.match("create") then content_tag( :i, nil, :class => "icon-file").html_safe
      when action.match("update") then content_tag( :i, nil, :class => "icon-pencil").html_safe
      when action.match("delete") then content_tag( :i, nil, :class => "icon-trash").html_safe        
      else "unknown"
    end
  end

  def render_activity_owner activity
    if activity.owner.nil?
      "Someone"
    else
      (activity.owner.name.nil? || activity.owner.name.empty?)  ? link_to(activity.owner.email, user_path(activity.owner)) : link_to(activity.owner.name, user_path(activity.owner))
    end
  end

  def render_activity_message parameters, results = String.new
    return nil if parameters.empty? || parameters["action"].nil?
    case
    when parameters["action"].match("create")
      results << "created a new video, " + render_activity_link(parameters["title"], parameters["pid"])
    when parameters["action"].match("delete")
      results << "deleted the video #{parameters["title"]}"
    when parameters["action"].match("update")
      results << "updated " + render_activity_link(parameters["title"], parameters["pid"])
      results << render_activity_changes(parameters["changes"])
    else
      results << "some other kind of activity"
    end
    return results.html_safe
  end

  def render_activity_link title, pid
    if ActiveFedora::Base.exists?(pid) && !pid.nil?
      link_to(title, catalog_path(pid))
    else
      title + ", but it has since been deleted"
    end
  end

  def render_activity_changes changes, results = String.new
    results << '<dl class="dl-horizontal dl-invert">'
    changes.each_key do |field|
      unless changes[field] == [""] || changes[field].nil? || changes[field].empty?
        results << "<dt>"+format_activity_field_label(field)+"</dt>"
        results << "<dd>"+format_activity_field(changes[field])+"</dd>"
      end
    end
    results << "</dl>"
    return results.html_safe
  end

  def format_activity_field_label field
    if field.match("title_label")
      "Label"
    else
      field.gsub(/_/," ").titleize
    end
  end

  def format_activity_field content
    case
    when content.is_a?(String)
      then content
    when content.is_a?(Array)
      then content.delete_if { |x| x.empty? }.join("<br/>")
    when content.is_a?(Hash)
      then content.values.delete_if { |x| x.empty? }.join("<br/>")
    end
  end

end