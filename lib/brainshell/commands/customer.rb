module Brainshell
  module Commands
    class Customer < Base

      desc 'find ID', 'Get customer by identifier'
      def find(id)
        customer = Braintree::Customer.find(id)

        build_table([customer])
      end

    end
  end
end