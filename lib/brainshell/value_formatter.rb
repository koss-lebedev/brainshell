module Brainshell
  module ValueFormatter

    KNOWN_FORMAT_METHODS = {
        BigDecimal => :big_decimal,
        DateTime => :date_time,
        Braintree::CreditCard => :payment_method,
        Braintree::Subscription => :subscription
    }.freeze

    def format_value(value)
      klass = value.is_a?(Array) ? value[0].class : value.class
      format_method = KNOWN_FORMAT_METHODS[klass]
      format_method ? send(format_method, value) : value
    end

  protected

    def big_decimal(value)
      value.to_f
    end

    def date_time(value)
      value.iso8601
    end

    def payment_method(value)
      value.map(&:token)
    end

    def subscription(value)
      value.map(&:id)
    end

  end
end