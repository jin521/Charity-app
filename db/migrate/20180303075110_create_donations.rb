class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :campaign_id
      t.text :email
      t.float :amount
      t.text :credit_card_details
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :donations, :campaign_id
  end
end
