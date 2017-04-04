class CreateTplays < ActiveRecord::Migration[5.0]
  def change
    create_table :tplays do |t|
      t.integer :category_id
      t.string :name
      t.string :status, default: 'off show'
      t.integer :ticket,default: 0
      t.string :tplay_id
      t.decimal :bprice, precision:5, scale:2
      t.decimal :price, precision:5, scale:2
      t.text :description
      t.timestamps
    end

    add_index :tplays,[:status,:category_id]
    add_index :tplays,[:category_id]
    add_index :tplays,[:tplay_id], unique: true
    add_index :tplays,[:name]
  end
end