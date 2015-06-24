class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :roaster

      t.timestamps null: false
    end
  end
end
