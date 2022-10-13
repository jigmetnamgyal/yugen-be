# frozen_string_literal: true

# TODO: Refactor this class and it's methods

module Mutations
  class ProceedCheckout < BaseMutation
    field :status, Boolean, null: false

    def resolve
      # Integrate payment system here. For now just change the flag
      current_user.orders.each { |order| order.update!(payment_completed: true) }
      # TODO: calculate: Funding received, grant contribution, Voting power, Total Voting power of grant

      update_project_total_contributor!
      update_voting_power_for_project!
      total_voting_power_for_grant!
      funding_received!

      { status: true }
    end

    # Calculate the total Contributor of the project.
    def update_project_total_contributor!
      projects.each do |project|
        total_contributor = Order.where(project_id: project.id, payment_completed: true).count

        project.update!(total_contributor: total_contributor)
      end
    end

    def update_voting_power_for_project!
      projects.each do |project|
        next unless project.grant_id

        sum = 0.0

        # use each with object instead. Too tired rn
        Order.where(project_id: project.id, payment_completed: true).each do |project_order|
          sum += Math.sqrt(project_order.matching_pool_contribution)
        end

        project.update!(voting_power: sum**2)
      end
    end

    def total_voting_power_for_grant!
      Grant.all.each do |grant|
        total_vp = grant.projects.sum(:voting_power)
        grant.update!(total_voting_power: total_vp)
      end
    end

    def funding_received!
      projects.each do |project|
        fund_in_nu = 0.0
        fund_in_eth = 0.0

        Order.where(project_id: project.id, payment_completed: true).each do |order|
          fund_in_nu += order.matching_pool_contribution if order.payment_type == 'nu'
          fund_in_eth += order.matching_pool_contribution if order.payment_type == 'eth'
        end

        FundingInfo.create!(project_id: project.id, funding_in_eth: fund_in_eth, funding_in_nu: fund_in_nu)
      end
    end

    def projects
      @_projects ||= Project.all
    end
  end
end
