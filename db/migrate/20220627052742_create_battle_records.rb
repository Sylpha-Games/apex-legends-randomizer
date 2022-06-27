class CreateBattleRecords < ActiveRecord::Migration[5.2]
  
  def change
    create_table :battle_records do |t|
      t.references :user, foreign_key: true
      t.references :legend, foreign_key: true
      t.references :weapon, foreign_key: true
      t.references :stage, foreign_key: true
      t.integer :damage
      t.timestamps
    end
  end
  
end
