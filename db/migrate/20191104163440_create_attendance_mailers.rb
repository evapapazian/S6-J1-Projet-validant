class CreateAttendanceMailers < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_mailers do |t|

      t.timestamps
    end
  end
end
