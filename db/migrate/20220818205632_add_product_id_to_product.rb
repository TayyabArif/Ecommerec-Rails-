class AddProductIdToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :code, :integer
    add_index :products, :code, unique: true
  end
end
