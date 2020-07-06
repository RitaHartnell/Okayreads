class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username #unique
      t.string :displayname #just nums & letters e.g first and lastname
      t.integer :age
      t.string :location
      t.timestamps
    end
  end
end
