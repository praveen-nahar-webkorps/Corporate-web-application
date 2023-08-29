class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :first_name
      t.string :last_name
      t.string :add

      t.timestamps
    end
  end
end
