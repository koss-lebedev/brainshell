module Brainshell
  module Commands
    class Base < Thor

      include ValueFormatter

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


