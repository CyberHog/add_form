class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name		# 氏名
      t.boolean :business	# ビジネスor個人

      t.timestamps
    end
  end
end
