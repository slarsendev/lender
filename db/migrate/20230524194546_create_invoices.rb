class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :number, null: false
      t.float :amount, null: false
      t.date :due_date, null: false
      t.integer :status, default: 0
      t.belongs_to :borrower, index: true

      t.timestamps
    end
  end
end
