class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
        t.string :name
        t.string :address
        t.integer :pin
        t.integer :phone
        t.string :website
        t.string :tags
        t.belongs_to :city, :index => true
        t.timestamps
    end
  end
end
