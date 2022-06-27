class Weapon < ApplicationRecord
  
  belongs_to :weapon_category
  belongs_to :ammo
  
  has_many :battle_records
  
end
