class AddLineTotaltoLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :line_total, :decimal, default: 0
  end
end
