class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.text :text
      t.string :title
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
