class CreateBackendNews < ActiveRecord::Migration[5.1]
  def change
    create_table :backend_news do |t|
    	t.references :category
    	t.string :title
    	t.attachment :images
    	t.boolean :status
    	t.text :news_details
    	t.integer :number_view , default: 0
      t.timestamps
    end
  end
end
