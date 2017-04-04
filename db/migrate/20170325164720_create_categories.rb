class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :weight,default:0
      t.integer :tplays_ticket, default:0

      t.timestamps
    end

    add_index :categories, [:name]
  end
end