module Brainshell
  module Commands
    class Subscription < Base

      class << self

        def text_search_fields
          %w(id transaction_id).freeze
        end

        def multiple_search_fields
          %w(ids in_trial_period merchant_account_id plan_id status).freeze
        end

        def range_search_fields
          %w(billing_cycles_remaining days_past_due next_billing_date price).freeze
        end
      end

      desc 'find ID', 'Get subscription by identifier'
      def find(id)
        subscription = Braintree::Subscription.find(id)
        build_table([subscription])
      end

      desc 'query OPTIONS', 'Find subscriptions matching criteria specified in options'
      define_query_options
      def query
        run_query Braintree::Subscription
      end

    end
  end
end
