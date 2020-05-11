class Event < ApplicationRecord
  validates :text, presence: true
  has_many :comments
  belongs_to :user

  def self.search(search)
    return Event.all unless search
    Event.where('text LIKE(?)', "%#{search}%")
  end
end
