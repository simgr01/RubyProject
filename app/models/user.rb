class User < ApplicationRecord
  include SoftDeletable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    customer: "customer",
    company: "company"
  }

  has_many :listings
  has_many :bids

  has_many :sent_messages,
    class_name: "Message",
    foreign_key: :sender_id

  has_many :selling_conversations,
    class_name: "Conversation",
    foreign_key: :user_id

  has_many :buying_conversations,
    class_name: "Conversation",
    foreign_key: :company_id

  def display_name
    company_name.presence || "#{firstName} #{lastName}"
  end

  def soft_delete!
    transaction do
      super
      listings.find_each(&:soft_delete!)
    end
  end
  
end
