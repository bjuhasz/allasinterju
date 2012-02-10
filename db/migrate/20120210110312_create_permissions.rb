class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.references :user
      t.references :role

      t.timestamps
    end
  end
end
