require 'thor'
require 'braintree'

require 'brainshell/version'
require 'brainshell/value_formatter'
require 'brainshell/commands/base'
require 'brainshell/commands/customer'
require 'brainshell/commands/subscription'
require 'brainshell/commands/transaction'
require 'brainshell/commands/credit_card'
require 'brainshell/commands/merchant_account'

module Brainshell

  class Main < Thor

    desc 'customer OPTIONS', 'Query Braintree customers'
    subcommand 'customer', Commands::Customer

    desc 'subscription OPTIONS', 'Query Braintree subscriptions'
    subcommand 'subscription', Commands::Subscription

    desc 'transaction OPTIONS', 'Query Braintree transactions'
    subcommand 'transaction', Commands::Transaction

    desc 'credit_card OPTIONS', 'Query Braintree credit cards'
    subcommand 'credit_card', Commands::CreditCard

    desc 'merchant_account OPTIONS', 'Query Braintree merchant accounts'
    subcommand 'merchant_account', Commands::MerchantAccount

  end

end