class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
