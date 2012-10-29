class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.text :description
      t.date :date
      t.text :location

      t.timestamps
    end
  end
end
