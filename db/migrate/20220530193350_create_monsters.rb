class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :description
      t.belongs_to :monster_type
    end
  end
end
