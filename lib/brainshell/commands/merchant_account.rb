module Brainshell
  module Commands
    class MerchantAccount < Base

      desc 'find ID', 'Get merchant account by identifier'
      def find(id)
        merchant_account = Braintree::MerchantAccount.find(id)
        build_table([merchant_account])
      end

    end
  end
end

