class AddDetailsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :chapter, :bigint
    add_column :books, :percentage, :bigint
  end
end
