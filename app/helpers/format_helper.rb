module FormatHelper

  # ================================================
  # Date & Time Formatting
  # ================================================

  def format_timestamp_date(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%-m/%d/%Y")
  end

  def format_timestamp_date_sortable(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%Y-%m-%d")
  end

  def format_timestamp_datetime_sortable(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%Y-%m-%d %H:%M %P")
  end

  def format_timestamp_date_medium(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%a, %b #{timestamp.day.ordinalize}, %Y")
  end

  def format_timestamp_time(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%-l:%M %P %Z")
  end

  def format_timestamp_full(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%A, %B #{timestamp.day.ordinalize}, %Y at %-l:%M %P %Z")
  end

  def format_timestamp_long(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%a, %b #{timestamp.day.ordinalize}, %Y at %-l:%M %P %Z")
  end

  def format_timestamp_medium(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%-m/%d/%Y at %-l:%M %P %Z")
  end

  def format_timestamp_short(timestamp = nil)
    return "" if timestamp.nil?
    timestamp.getlocal.strftime("%-m/%d/%Y %-l:%M %P %Z")
  end

  # ================================================
  # Number Formatting
  # ================================================

  def format_currency(amount = nil, precision = 2)
    return "" if amount.nil?
    number_to_currency(amount, precision: precision)
  end

  def format_dollar(amount = nil)
    return "" if amount.nil?
    number_to_currency(amount, precision: 0)
  end

  def format_number(number = nil, precision = 0)
    return "" if number.nil?
    number_with_precision(number, precision: precision, delimiter: ',')
  end

  def format_percentage(number = nil, precision = 0)
    return "" if number.nil?
    "#{format_number(number, precision)}%"
  end

  # ================================================
  # URL Formatting
  # ================================================

  def format_url(url = nil)
    return "" if url.nil?
    return url if url.start_with?("http")
    url.insert(0, "http://")
  end

  def format_phone_link(phone_number)
    return "" if phone_number.nil?
    sets_of_numbers = phone_number.scan(/[0-9]+/)
    return "" if sets_of_numbers.length.zero?
    formatted_number = "+1-#{sets_of_numbers.join('-')}"
    link_to phone_number, "tel:#{formatted_number}"
  end

  # ================================================
  # Text Formatting
  # ================================================

  def format_ellipsis(text = nil, limit = 500)
    return "" if text.nil? || text.empty?
    return text if text.length <= limit
    text[0..limit+1] + "..."
  end

  def count_label(count = 0, label = "")
    return "" unless label.present?
    counter = count.round(0).to_i
    "#{format_number(counter)} #{label.pluralize(counter)}"
  end

  # ================================================
  # Alert Formatting
  # ================================================

  def format_alert(flash_type = nil)

    case flash_type
    when "success"
      "alert-success"
    when "warning", "alert"
      "alert-warning"
    when "danger", "error"
      "alert-danger"
    else
      "alert-info"
    end

  end

  # ================================================
  # Class Formatting
  # ================================================

  def class_if(class_name = nil, value = false)
    return " " unless class_name.present?
    value == true ? " #{class_name} " : " "
  end

  def show_if(value = false)
    class_if("show", value == true)
  end

  def active_if(value = false)
    class_if("active", value == true)
  end

  def hidden_if(value = false)
    class_if("hidden", value == true)
  end

  def red_if_negative(amount = 0)
    class_if("red", amount.present? && amount.negative?)
  end

end
