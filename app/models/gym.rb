class Gym < ApplicationRecord
    has_many :clients, through: :memberships
    has_many :memberships, dependent: :destroy
    accepts_nested_attributes_for :memberships
    validates :name, presence: true
    validates :address, presence: true

end