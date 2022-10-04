# frozen_string_literal: true

class AttachedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.attached?

    record.errors.add(attribute, :attached)
  end
end
