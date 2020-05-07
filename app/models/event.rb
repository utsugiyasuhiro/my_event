class Event < ApplicationRecord
  validates :text, presence: true
end
