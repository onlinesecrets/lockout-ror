class CreateBus < ActiveRecord::Migration
  def change
    create_table :buses do |t|
        t.belongs_to :company
        t.string     :name
        t.integer    :type
        t.text       :reg_no
        t.text       :body_no
        t.text       :plate_no
        t.integer    :capacity
        t.integer    :status
        t.timestamps null: false
    end
  end


end
