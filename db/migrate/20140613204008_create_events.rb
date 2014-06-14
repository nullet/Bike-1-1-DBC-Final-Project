class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :requester_id
      t.integer :responder_id
      t.text    :request_text
      t.float   :latitude
      t.float   :longitude
      t.boolean :active

      t.timestamps
    end
    add_index   :events, :requester_id, unique: true
    add_index   :events, :responder_id, unique: true
  end
end
