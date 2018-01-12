class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :resolution_id
      t.integer :state, default: 1

      t.timestamps
    end
  end
end
