class CreateSiteWides < ActiveRecord::Migration
  def change
    create_table :site_wides do |t|
      t.string :name
      t.text :value
      t.string :category

      t.timestamps
    end
  end
end
