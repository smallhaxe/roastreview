class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :color
      t.string :type
      t.string :coffee_name
      t.string :roaster

      t.timestamps null: false
    end
  end
end
