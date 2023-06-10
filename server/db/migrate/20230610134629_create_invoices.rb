class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices, id: false do |t|
      t.string :id, index: true, unique: true, null: false
      t.string :from_data, array: true
      t.string :to_data, array: true
      t.date :issued_date
      t.date :due_date
      t.text :description
      t.text :items, array: true
    end
    add_reference :invoices, :user, foreign_key: true
    execute "ALTER TABLE invoices ADD PRIMARY KEY (id);"
  end
end
