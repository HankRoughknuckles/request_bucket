class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :information
      t.references :endpoint, index: true

      t.timestamps null: false
    end
    add_foreign_key :requests, :endpoints
  end
end
