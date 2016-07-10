module Brainshell
  module Commands
    class Subscription < Base

      desc 'find ID', 'Get subscription by identifier'
      def find(id)
        subscription = Braintree::Subscription.find(id)

        build_table([subscription])
      end

      method_option :ids, type: :array
      method_option :plan_id, type: :array, aliases: '-pi'
      method_option :status, type: :array
      method_option :price
      method_option :billing_cycles_remaining, aliases: '-bcr'
      method_option :days_past_due, aliases: '-dpd'
      desc 'query OPTIONS', 'Find subscriptions matching criteria specified in options'
      def query
        search_results = Braintree::Subscription.search do |search|
          assign_multiple_value_criteria(search, :ids)
          assign_multiple_value_criteria(search, :plan_id)
          assign_multiple_value_criteria(search, :status)

          assign_range_criteria(search, :price)
        end

        build_table(search_results.to_a)
      end

    end
  end
end
