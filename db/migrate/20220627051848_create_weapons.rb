class CreateWeapons < ActiveRecord::Migration[5.2]
  
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :image
      t.references :weapon_category, foreign_key: true
      t.references :ammo, foreign_key: true
      t.timestamps
    end
  end
  
end
