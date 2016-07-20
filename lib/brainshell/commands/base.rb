module Brainshell
  module Commands
    class Base < Thor

      include ValueFormatter

      class_option :columns, type: :array

      class << self

        def define_query_options
          multiple_search_fields.each do |field|
            method_option field, type: :array
          end
          text_search_fields.each do |field|
            method_option field
          end
          range_search_fields.each do |field|
            method_option field
          end
        end

        def text_search_fields; [] end
        def multiple_search_fields; [] end
        def range_search_fields; [] end

      end

    protected

      def run_query(entity)
        search_results = entity.search do |search|

          self.class.text_search_fields.each { |field| assign_text_criteria(search, field) }
          self.class.multiple_search_fields.each { |field| assign_multiple_value_criteria(search, field) }
          self.class.range_search_fields.each { |field| assign_range_criteria(search, field) }

        end

        build_table(search_results.to_a)
      end

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

      def assign_text_criteria(search, field)
        if criteria = options[field]
          search.send(field).is criteria
        end
      end

      def build_table(objects, columns = nil)
        rows = []
        objects.each do |object|
          rows << render_row(object,columns)
        end
        shell.print_table(rows)
      end

      def render_row(object, columns)
        columns = columns ||(options[:columns] ? options[:columns] : default_columns)
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


