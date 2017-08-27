class RemoveRequestFromEndpoints < ActiveRecord::Migration
  def change
    remove_column :endpoints, :request
  end
end
