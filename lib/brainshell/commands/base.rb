module Brainshell
  module Commands
    class Base < Thor

      include ValueFormatter

      class_option :columns, type: :array, default: []

      protected

      def assign_range_criteria(search, field)
        if criteria = options[field]
          if criteria.match(/([\d.]+)\.\.([\d.]+)/)
            search.send(field).between $1, $2
          elsif criteria.match(/\Agt([\d.]+)/)
            search.send(field) >= $1
          elsif criteria.match(/\Alt([\d.]+)/)
            search.send(field) <= $1
          elsif criteria.match(/([\d.]+)/)
            search.send(field).is $1
          end
        end
      end

      def assign_multiple_value_criteria(search, field)
        if criteria = options[field]
          if criteria.size == 1
            search.send(field).is criteria
          else
            search.send(field).in criteria
          end
        end
      end

      def build_table(objects)
        rows = []
        objects.each do |object|
          rows << render_row(object)
        end
        shell.print_table(rows)
      end

      def render_row(object)
        columns = default_columns + options[:columns]
        columns.map { |column| get_column_value(object, column) }
      end

      def default_columns
        [ :id ]
      end

      def get_column_value(object, column)
        value = object.send(column)
        format_value(value)
      end

    end
  end
end


