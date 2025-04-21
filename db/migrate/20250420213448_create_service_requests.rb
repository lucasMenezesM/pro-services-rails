class CreateServiceRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :service_requests do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :status, null: false, default: 'open'
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
