class CreateTplayImages < ActiveRecord::Migration[5.0]
  def change
    create_table :tplay_images do |t|
      t.belongs_to :tplays

      t.attachment :image # use to store images size name...
      t.integer :zhuci, default:0 # divide the imgs into main image and sub image
      t.timestamps
    end
  end
end
