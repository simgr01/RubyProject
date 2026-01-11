class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    customer: "customer",
    company: "company"
  }

  has_many :listings, dependent: :destroy
  has_many :bids, dependent: :destroy

  validates :role, presence: true
end
