module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-warning"
    end
  end

  def color(type)
    case type.to_sym
      when :notice then "blue"
      when :success then "green"
      when :error then "red"
      when :alert then "gray"
    end
  end
end