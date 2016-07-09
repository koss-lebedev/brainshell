module Brainshell
  module Commands
    class Transaction < Base

      desc 'find TOKEN', 'Get transaction by identifier'
      def find(token)
        transaction = Braintree::Transaction.find(token)

        build_table([transaction])
      end

    end
  end
end
