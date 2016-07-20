module Brainshell
  module Commands
    class Transaction < Base

      class << self

        def text_search_fields
          %w(billing_company billing_country_name billing_extended_address billing_first_name
billing_last_name billing_locality billing_postal_code billing_region billing_street_address
credit_card_cardholder_name credit_card_expiration_date credit_card_number credit_card_unique_identifier
currency customer_company customer_email customer_fax customer_first_name customer_id customer_last_name
customer_phone customer_website id order_id payment_method_token paypal_authorization_id paypal_payer_email
paypal_payment_id processor_authorization_code settlement_batch_id shipping_company shipping_country_name
shipping_extended_address shipping_first_name shipping_last_name shipping_locality shipping_postal_code
shipping_region shipping_street_address).freeze
        end

        def multiple_search_fields
          %w(created_using credit_card_card_type credit_card_customer_location ids merchant_account_id
payment_instrument_type refund settled_at source status type user).freeze
        end

        def range_search_fields
          %w(amount authorization_expired_at authorized_at created_at dispute_date failed_at
gateway_rejected_at processor_declined_at submitted_for_settlement_at voided_at).freeze
        end

      end

      desc 'find TOKEN', 'Get transaction by identifier'
      def find(token)
        transaction = Braintree::Transaction.find(token)

        build_table([transaction])
      end

      desc 'query OPTIONS', 'Find subscriptions matching criteria specified in options'
      define_query_options
      def query
        run_query Braintree::Transaction
      end

      desc 'disbursement_details TOKEN', 'Get disbursement details by identifier'
      def disbursement_details(token)
        transaction = Braintree::Transaction.find(token)

        build_table([transaction.disbursement_details], [:disbursement_date, :funds_held?, :settlement_amount, :success])
      end

    end
  end
end
