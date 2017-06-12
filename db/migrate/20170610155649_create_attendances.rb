class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :check_in
      t.string :check_out
      t.integer :user_id

      t.timestamps
    end
  end
end
