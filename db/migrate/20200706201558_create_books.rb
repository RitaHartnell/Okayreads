class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string  :title
      t.belongs_to :author
      t.integer :length
      t.timestamps
    end
  end
end
