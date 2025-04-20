class CreateServices < ActiveRecord::Migration[7.2]
  def change
    create_table :services do |t|
      t.string :name
      t.references :service_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
