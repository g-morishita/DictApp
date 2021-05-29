class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
