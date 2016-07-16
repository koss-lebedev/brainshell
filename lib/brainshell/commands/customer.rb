module Brainshell
  module Commands
    class Customer < Base

      class << self

        def text_search_fields
          %w(address_country_name address_extended_address address_first_name
address_last_name address_locality address_postal_code address_region address_street_address cardholder_name
company credit_card_expiration_date credit_card_number email fax first_name id last_name payment_method_token
payment_method_token_with_duplicates paypal_account_email phone website).freeze
        end

        def multiple_search_fields
          %w(ids).freeze
        end

        def range_search_fields
          %w(created_at).freeze
        end

      end

      desc 'find ID', 'Get customer by identifier'
      def find(id)
        customer = Braintree::Customer.find(id)
        build_table([customer])
      end

      desc 'query OPTIONS', 'Find customer matching criteria specified in options'
      define_query_options
      def query
        run_query Braintree::Customer
      end

    end
  end
end