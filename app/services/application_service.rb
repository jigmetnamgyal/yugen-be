# frozen_string_literal: true

class ApplicationService
  attr_accessor :params, :current_user

  def initialize(args, current_user)
    @params = args
    @current_user = current_user
  end

  def self.class(args, current_user)
    new(args, current_user).call
  end
end
