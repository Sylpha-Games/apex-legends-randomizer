class BattleRecord < ApplicationRecord
  
  belongs_to :user
  belongs_to :legend
  belongs_to :weapon
  belongs_to :stage
  
end
