module Brainshell
  module ValueFormatter

    KNOWN_FORMAT_METHODS = {
        BigDecimal => :big_decimal,
        DateTime => :date_time,
        Braintree::CreditCard => :model_with_token,
        Braintree::Subscription => :model_with_id
    }.freeze

    def format_value(value)
      if value.is_a? Array
        value.map { |item| format_value(item) }.join(',')
      else
        format_method = KNOWN_FORMAT_METHODS[value.class]
        format_method ? send(format_method, value) : value
      end
    end

  protected

    def big_decimal(value)
      value.to_f
    end

    def date_time(value)
      value.iso8601
    end

    def model_with_token(value)
      value.token
    end

    def model_with_id(value)
      value.id
    end

  end
end