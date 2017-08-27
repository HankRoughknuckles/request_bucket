class AddSignatureToEndpoints < ActiveRecord::Migration
  def change
    add_column :endpoints, :signature, :text
  end
end
