class CreateBackendCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :backend_categories do |t|
      t.string :name
      # t.integer :parent_id
      t.boolean :status

      t.timestamps
    end
  end
end
