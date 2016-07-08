require 'thor'
require 'braintree'

require 'brainshell/version'
require 'brainshell/commands/base'
require 'brainshell/commands/subscription'
require 'brainshell/commands/customer'

module Brainshell

  class Main < Thor

    desc 'subscription OPTIONS', 'Query Braintree subscriptions'
    subcommand 'subscription', Commands::Subscription

    desc 'customer OPTIONS', 'Query Braintree customers'
    subcommand 'customer', Commands::Customer

  end

end