class Company < ApplicationRecord
  validates :store_name, :email, :phone, presence: true
  validates :email, :cnpj, uniqueness:  true


  validates_length_of :store_name, maximum: 200
  validates_length_of :city, maximum: 60
  validates_length_of :state, maximum: 2
  validates_length_of :local_address, maximum: 255
  validates_length_of :email, maximum: 60
  validates_length_of :phone, maximum: 30
end
