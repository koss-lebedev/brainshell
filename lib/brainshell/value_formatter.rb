module Brainshell
  module ValueFormatter

    KNOWN_FORMAT_METHODS = {
        BigDecimal => :big_decimal,
        DateTime => :date_time
    }.freeze

    def format_value(value)
      format_method = KNOWN_FORMAT_METHODS[value.class]
      format_method ? send(format_method, value) : value
    end

  protected

    def big_decimal(value)
      value.to_f
    end

    def date_time(value)
      value.iso8601
    end

  end
end