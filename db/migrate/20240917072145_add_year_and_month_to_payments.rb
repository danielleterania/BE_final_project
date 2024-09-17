class AddYearAndMonthToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :year, :integer
    add_column :payments, :month, :string
  end
end
