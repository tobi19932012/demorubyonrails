class AddSlugToColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :backend_categories, :slug, :string
    add_column :backend_news, :slug, :string
    add_index  :backend_categories, :slug
    add_index  :backend_news, :slug
  end
end
