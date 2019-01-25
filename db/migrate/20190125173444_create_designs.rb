class CreateDesigns < ActiveRecord::Migration[5.1]
  def change
    create_table :designs do |t|
      t.string :name
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
