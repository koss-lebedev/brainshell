module Commands
  class Base < Thor

    class_option :columns, type: :array, default: []

  protected

    def build_table(objects)
      rows = []
      objects.each do |object|
        rows << render_row(object)
      end
      shell.print_table(rows)
    end

    def render_row(object)
      default_columns = [ object.id ]
      default_columns + custom_columns(options[:columns], object)
    end

    def custom_columns(columns, object)
      columns.map do |include|
        value = object.send(include)
        format_value(value)
      end
    end

    def format_value(value)
      case value
        when BigDecimal
          value.to_f
        when DateTime
          value.iso8601
        else
          value
      end
    end

  end
end
