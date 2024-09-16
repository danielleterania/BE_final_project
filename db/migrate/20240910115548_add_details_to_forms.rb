class AddDetailsToForms < ActiveRecord::Migration[7.1]
  def change
    add_column :forms, :title, :string
    add_column :forms, :name, :string
    add_column :forms, :address, :string
    add_column :forms, :contact_number, :string
    add_column :forms, :date, :datetime
    add_column :forms, :details, :text
  end
end
