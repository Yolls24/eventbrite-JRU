class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    # Optionnel : éviter qu'un même user s'inscrive plusieurs fois au même event
    add_index :attendances, [:user_id, :event_id], unique: true
  end
end
