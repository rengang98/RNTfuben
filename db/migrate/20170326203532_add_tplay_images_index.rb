class AddTplayImagesIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :tplay_images, [:tplay_id, :zhuci]
  end
end
