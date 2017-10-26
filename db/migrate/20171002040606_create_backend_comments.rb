class CreateBackendComments < ActiveRecord::Migration[5.1]
  def change
    create_table :backend_comments do |t|
      t.string :title
      t.references :news
      t.references :user
      t.text :content
      t.boolean :status , default: false
      t.timestamps
    end
  end
end
