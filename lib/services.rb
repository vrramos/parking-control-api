class Services
  def get_time(time)
    return time.scan(/[0-9]{2}[:][0-9]{2}:[0-9]{2}/)
  end

  def mask_plate(plate)
    return !!plate.match(/[a-zA-Z]{3}[-][0-9]{4}/)
  end

  def calculating_time(data)
    get_created_time = data.map { |vehicle| "#{vehicle.created_at}"}
    created_time_str = get_created_time.join(', ')
    get_hour_regex = get_time(created_time_str)
    t = Time.now
    time_now = t.strftime('%H:%M:%S')
    created_hour_formated = get_hour_regex.join(', ')
    if created_hour_formated > time_now
      return (Time.parse(created_hour_formated) - Time.parse(time_now)) / 60
    else
      return (Time.parse(time_now) - Time.parse(created_hour_formated)) / 60
    end
  end
end