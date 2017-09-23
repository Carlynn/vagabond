class AddSlugToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
    t.string :slug, after: :id
  end
  end
end
