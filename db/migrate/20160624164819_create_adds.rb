class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.integer :times_added

      t.timestamps null: false
    end
  end
end
