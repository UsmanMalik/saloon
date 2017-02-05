class AddImageToAdsTable < ActiveRecord::Migration
def up
    add_attachment :ads, :ad_image
  end

  def down
    remove_attachment :ads, :ad_image
  end
end
