module Brainshell
  module Commands
    class CreditCard < Base

      desc 'find ID', 'Get credit card by identifier'
      def find(id)
        credit_card = Braintree::CreditCard.find(id)
        build_table([credit_card])
      end

    end
  end
end

