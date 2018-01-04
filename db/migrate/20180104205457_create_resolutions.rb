class CreateResolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :resolutions do |t|
      t.string :name
      t.text :mission_statement
      t.integer :state, default: 1
      t.integer :user_id
      t.time :spam_time
      t.boolean :sun
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thu
      t.boolean :fri
      t.boolean :sat

      t.timestamps
    end
    add_column :resolutions, :goal_ids, :text, default: '[]', array:true
  end
end
