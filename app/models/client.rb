class Client < ApplicationRecord
    has_many :gyms, through: :memberships
    has_many :memberships, dependent: :destroy
    accepts_nested_attributes_for :memberships

    validates :name, presence: true
    validates :age, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 18, message: '-> Must be older than 18 to sign up'}

    scope :client_memberships, -> {Client.joins(:memberships)}

end