class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.references :clinic, foreign_key: true		# clinicの外部キー
      t.references :receipt, foreign_key: true	# receiptの外部キー
      t.integer :content_id						          # コースID
      t.string :content_name					          # コース名
      t.integer :price							            # 価格
      t.integer :attached_point					        # ポイント

      t.timestamps
    end
  end
end 
