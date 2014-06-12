class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :password
      t.string  :phone
      t.float   :hb_latitude
      t.float   :hb_longitude
      t.float   :hb_radius
      t.string  :home_base
      t.integer :karma_count

      t.timestamps
    end
  end
end
