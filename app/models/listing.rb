class Listing < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, :description, presence: true

  enum :status, {
    open: "open",
    closed: "closed"
  }
end
