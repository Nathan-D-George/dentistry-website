class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.references :user, null: false, foreign_key: true
      t.integer :app_type, default: 0
      t.integer :cost, default: 300

      
    end
  end
end
