class Listing < ApplicationRecord
  include SoftDeletable

  belongs_to :user
  has_many :bids
  has_many :conversation

  validates :title, :description, presence: true

  enum :status, {
    open: "open",
    closed: "closed"
  }

  def soft_delete!
    transaction do
      super
      bids.find_each(&:soft_delete!)
      conversation&.find_each(&:soft_delete!)
    end
  end

end
