class Membership < ApplicationRecord
    belongs_to :client
    belongs_to :gym
    accepts_nested_attributes_for :gym
    accepts_nested_attributes_for :client
    
    validates :charge, presence: true, numericality: {only_integer: true}
    validates_associated :gym
    validates_associated :client
  
  end