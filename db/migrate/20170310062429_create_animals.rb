class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
    	t.string :name 
    	t.string :specie
    	t.integer :category_id

      t.timestamps
    end
  end
end
