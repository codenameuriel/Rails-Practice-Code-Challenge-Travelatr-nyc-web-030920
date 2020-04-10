class AddImageUrlToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :image_url, :string
  end
end
