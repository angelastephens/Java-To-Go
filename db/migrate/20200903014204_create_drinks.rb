class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink_name
      t.string :temperature
      t.string :caffeine_type
      t.string :milk_options
      t.string :flavors
    end
  end
end
