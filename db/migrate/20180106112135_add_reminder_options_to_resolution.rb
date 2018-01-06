class AddReminderOptionsToResolution < ActiveRecord::Migration[5.1]
  def change
    add_column :resolutions, :cell, :boolean
    add_column :resolutions, :email, :boolean
  end
end
