class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 }
  validates :address, presence: true, length: { minimum: 1 }
  validates :phone, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
end
