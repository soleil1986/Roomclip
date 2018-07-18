class Dailyclip < ApplicationRecord
  belongs_to :daily, optional: true
  belongs_to :clip
end
