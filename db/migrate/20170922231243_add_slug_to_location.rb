class AddSlugToLocation < ActiveRecord::Migration[5.1]
  def change
    change_table :locations do |t|
    t.string :slug, after: :id
  end
  end
end
