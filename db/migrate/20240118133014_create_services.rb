class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :min_cost

      t.timestamps
    end
  end
end
