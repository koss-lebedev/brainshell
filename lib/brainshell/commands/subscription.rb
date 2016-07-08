module Commands
  class Subscription < Thor

    class_option :include, type: :array, default: []

    desc 'find ID', 'Returns subscription by identifier'
    def find(id)
      subscription = Braintree::Subscription.find(id)

      table = subscriptions_table([subscription])
      shell.print_table(table)
    end

    subscription_statuses = Braintree::Subscription::Status::All

    desc "in_status [#{subscription_statuses.join(', ')}]", 'Get subscriptions in specified status'
    def in_status(status)
      search_results = Braintree::Subscription.search do |search|
        search.status.is status
      end

      table = subscriptions_table(search_results.to_a)
      shell.print_table(table)
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
      ] + includes(subscription)
    end

    def includes(subscription)
      options[:include].map { |include| subscription.send(include) }
    end

  end
end
