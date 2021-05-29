class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.references :item, null: false, foreign_key: true
      t.text :body
      t.integer :order

      t.timestamps
    end
  end
end
