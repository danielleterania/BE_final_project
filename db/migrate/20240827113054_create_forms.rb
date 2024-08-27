class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.text :content
      t.boolean :approved

      t.timestamps
    end
  end
end
