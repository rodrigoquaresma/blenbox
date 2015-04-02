module FillsTimeHelper

  def hours_in
    hours_in = Array.new (15) {rand(8..10)}
  end

  def minutes_in
    minutes_in = Array.new (15) {rand(0..59)}
  end

  def xhour_in
    hours_in.each do |hour_in|
      hour_in
    end
  end

  def xminute_in
    minutes_in.each do |minute_in|
      minute_in
    end
  end

  def time_build(hour_in, minute_in)
    return "#{hour_in}:#{minute_in}"
  end

end
