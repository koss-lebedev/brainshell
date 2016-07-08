module Commands
  class Subscription < Thor

    desc 'find ID', 'Returns subscription details by identifier'
    def find(id)
      data = [
          ['row1col1', 'row1col2'],
          ['row2col1', 'row2col2']
      ]

      Thor::Shell::Basic.new.print_table(data)
    end

    subscription_statuses = Braintree::Subscription::Status::All

    desc "in_status [#{subscription_statuses.join(', ')}]", 'Get subscription IDS that are in specified status'
    def in_status(status)
      search_results = Braintree::Subscription.search do |search|
        search.status.is status
      end

      subscriptions = search_results.to_a

      table = subscriptions_table(subscriptions)
      Thor::Shell::Basic.new.print_table(table)
    end

  private

    def subscriptions_table(subscriptions)
      rows = []
      subscriptions.each do |subscription|
        rows << render_row(subscription)
      end
      rows
    end

    def render_row(subscription)
      [
          subscription.id,
          subscription.price.to_f,
          subscription.created_at,
          subscription.plan_id,
          subscription.status
      ]
    end

  end
end
