class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :description
      t.integer :attack_power
      t.belongs_to :monster
    end
  end
end
