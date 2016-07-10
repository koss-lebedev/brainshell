# Brainshell

Brainshell is a console interface to your Braintree account. To get started, simply install the gem and set
the following environment variables:

    export BRAINTREE_ENVIRONMENT=can be production or staging
    export BRAINTREE_MERCHANT_ID=your Braintree merchant id
    export BRAINTREE_PUBLIC_KEY=your Braintree public key
    export BRAINTREE_PRIVATE_KEY=your Braintree private key

## Installation

You can install it by running:

    $ gem install brainshell

## Usage

For detailed description, run `brainshell help` and `brainshell command help`

Brainshell commands usually contain sub-command name, one or more filter options, and optional array of columns to
be rendered. By default, brainshell will print only IDs of matching objects.

For example, to find active and pending
subscriptions with price in range between 100.0 and 200.0 you can use the following command:

    brainshell subscription query --price=10..300 --status=Active Pending --columns=id price status created_at

This command will print the result like this:

    d6nbxr  300.0  Active  2016-06-26 10:24:55 UTC
    2dh32m   30.0  Active  2016-05-02 14:39:01 UTC

##Options values

There are three types of values that you can specify for options:

    1. Text value
    2. Range value
    2. Multiple value

To see which columns support which types of values, please refer to Braintree documentation.
Text values can be passed as simple string arguments. If value contains space, it should be enclosed in double quotes:

    --status=Active
    --status="Past Due"

Range values can have values of _equal_, _greater than_, _less than_, and _in range_ (inclusive):

    --price=100.0
    --price=gt100.0
    --price=lt200.0
    --price=100..200

Multiple values are passed separated by whitespace:

    --status=Active Pending

