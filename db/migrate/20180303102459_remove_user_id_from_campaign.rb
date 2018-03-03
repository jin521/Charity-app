class RemoveUserIdFromCampaign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :user_id, :integer
  end
end
