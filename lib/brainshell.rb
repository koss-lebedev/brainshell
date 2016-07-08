require 'thor'
require 'braintree'

require 'brainshell/version'
require 'brainshell/commands/subscription'

module Brainshell

  class Main < Thor

    desc 'subscription OPTIONS', 'Query your Braintree subscriptions'
    subcommand 'subscription', Commands::Subscription

  end

end