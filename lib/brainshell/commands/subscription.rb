module Brainshell
  module Commands
    class Subscription < Base

      desc 'find ID', 'Get subscription by identifier'
      def find(id)
        subscription = Braintree::Subscription.find(id)

        build_table([subscription])
      end

      desc "in_status [#{Braintree::Subscription::Status::All.join(', ')}]", 'Get subscriptions in specified status'
      def in_status(status)
        search_results = Braintree::Subscription.search do |search|
          search.status.is status
        end

        build_table(search_results.to_a)
      end

    end
  end
end
