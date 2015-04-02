module FillsTimeHelper

  def hours_in
    hours_in = Array.new (15) {rand(8..10)}
    # hours_in.each do |hour_in|
    #   hour_in
    # end
  end

  def minutes_in
    minutes_in = Array.new (15) {rand(0..59)}
    # minutes_in.each do |minute_in|
    #   minute_in
    # end
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

  def time_in
    hours_in
  end


  def time_build(hour_in, minute_in)

    return "#{hour_in}:#{minute_in}"

  end


  def xtimes_in
    hours_in.each do |hour_in|
      hour_in
    end
    minutes_in.each do |minute_in|
      minute_in
    end
    # [hours_in],[minutes_in]
  end

  def time_ger

    # times_in.each do |time_in|

    # end




    # (0..5).each do |i|
    #    puts "Value of local variable is #{i}"
    # end


  end

end
