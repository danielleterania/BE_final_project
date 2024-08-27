class CreateAboutUs < ActiveRecord::Migration[7.1]
  def change
    create_table :about_us do |t|
      t.text :content

      t.timestamps
    end
  end
end
