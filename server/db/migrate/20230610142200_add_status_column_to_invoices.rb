class AddStatusColumnToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :status, :string, default: "pending", null: false
    Invoice.reset_column_information
    Invoice.all.each do |element|
      element.update_attribute :status, 'pending'
    end
  end
end
