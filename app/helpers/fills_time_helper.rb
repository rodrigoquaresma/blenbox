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

  def hours_in_l
    hours_in_l = Array.new (15) {rand(11..12)}
  end

  def minutes_in_l
    minutes_in_l = Array.new (15) {rand(0..59)}
  end

  def xhour_in_l
    hours_in_l.each do |hour_in_l|
      hour_in_l
    end
  end

  def xminute_in_l
    minutes_in_l.each do |minute_in_l|
      minute_in_l
    end
  end

  def time_build(hour, minute)
    return "#{hour}:#{minute}"
  end

end
