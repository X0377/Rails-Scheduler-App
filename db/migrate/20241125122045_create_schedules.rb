class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day
      t.text :memo

      t.timestamps
    end
  end
end
