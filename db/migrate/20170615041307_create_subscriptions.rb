class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :subscribed_to_id

      t.timestamps
    end
  end
end
