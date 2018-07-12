class Daily < ApplicationRecord
  has_many :dailyclips
  accepts_nested_attributes_for :dailyclips
end
