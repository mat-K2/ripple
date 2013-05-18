module ServicesHelper

  def feedback_time(time)
    diff_time = (Time.now - time).ceil
    if diff_time < 60
      "#{diff_time}s"
    elsif diff_time >= 60 && diff_time < 3600
      "#{diff_time / 60}m"
    elsif diff_time >= 3600 && diff_time < 86400
      "#{diff_time / 3600}h"
    elsif diff_time >= 86400
      "#{diff_time / 86400}d"
    end
  end
end
