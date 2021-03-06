class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  validates :address, presence: true, length: { minimum: 1 }
  validates :phone, presence: true, length: { minimum: 1 }, format: { with: /\d{3}-\d{3}-\d{4}/,message: "invalid phone number" }
  validates :description, presence: true, length: { minimum: 1 }

  belongs_to :owner
end
