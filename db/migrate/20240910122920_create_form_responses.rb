class CreateFormResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :form_responses do |t|
      t.references :form, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :contact_number
      t.date :date
      t.text :details
      t.boolean :approved

      t.timestamps
    end
  end
end
