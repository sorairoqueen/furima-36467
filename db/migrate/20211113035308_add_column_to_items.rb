class AddColumnToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_name, :string
    add_column :items, :price, :integer
    add_column :items, :item_category_id, :integer
    add_column :items, :item_status_id, :integer
    add_column :items, :fee_resp_id, :integer
    add_column :items, :prefecture_id, :integer
    add_column :items, :delivery_term_id, :integer
    add_column :items, :content, :string
  end
end
