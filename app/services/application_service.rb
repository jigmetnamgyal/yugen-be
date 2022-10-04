# frozen_string_literal: true

class ApplicationService
  include Assigner

  attr_accessor :params, :current_user

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  def self.call(args)
    new(args).call
  end

  def call; end
end
