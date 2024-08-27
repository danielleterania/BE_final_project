class CreateComplaints < ActiveRecord::Migration[7.1]
  def change
    create_table :complaints do |t|
      t.text :content
      t.text :response

      t.timestamps
    end
  end
end
