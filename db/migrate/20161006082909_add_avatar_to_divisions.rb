class AddAvatarToDivisions < ActiveRecord::Migration
  def up
    add_attachment :divisions, :avatar
  end

  def down
    remove_attachment :divisions, :avatar
  end
end
