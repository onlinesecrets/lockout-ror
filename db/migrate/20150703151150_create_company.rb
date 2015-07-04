class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :name
      t.string  :address
      t.string  :telno
      t.string  :email
      t.integer :status
      t.timestamps null: false

    end
  end

  def up
    change_column :companies , :status , :integer , default: 0
  end

  def down
    change_column :companies , :status , :integer , default: 0
  end
end
