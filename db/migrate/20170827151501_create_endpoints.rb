class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints do |t|
      t.text :request

      t.timestamps null: false
    end
  end
end
