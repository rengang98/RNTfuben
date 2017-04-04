class ChangeStatusDefault < ActiveRecord::Migration[5.0]
  def up
    change_column_default :tplays, :status, "on"
  end


end
