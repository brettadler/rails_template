module ConversionHelper

  # ================================================
  # Money conversions
  # ================================================

  def convert_dollars_to_cents(amount = nil)
    return if amount.nil?
    (amount * 100).round(0)
  end

  def convert_cents_to_dollars(amount = nil)
    return if amount.nil?
    (amount.to_f / 100.0).round(2)
  end

  def convert_cents_to_currency(amount = nil)
    return if amount.nil?
    dollars = convert_cents_to_dollars(amount.to_f)
    number_to_currency(amount, precision: 2)
  end

  # ================================================
  # Time conversions
  # ================================================

  def convert_hours_to_minutes(hours = nil)
    return if hours.nil?
    (hours.to_f * 60.to_f).to_i
  end

  def convert_minutes_to_seconds(minutes = nil)
    return if minutes.nil?
    (minutes.to_f * 60.to_f).to_i
  end

  def convert_seconds_to_milliseconds(seconds = nil)
    return if seconds.nil?
    seconds.to_i * 1000
  end

  def convert_minutes_to_milliseconds(minutes = nil)
    return if minutes.nil?
    seconds = convert_minutes_to_seconds(minutes)
    convert_seconds_to_milliseconds(seconds)
  end

end
