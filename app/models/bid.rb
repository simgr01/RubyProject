class Bid < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :price, numericality: { greater_than: 0 }


  def accept!
    transaction do
      listing.update!(status: :closed)
      update!(accepted: true)
    end
  end
end
