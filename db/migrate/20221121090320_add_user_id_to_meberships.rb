class AddUserIdToMeberships < ActiveRecord::Migration[7.0]
  def change
    change_table :memberships do |t|
      t.rename :user_id, :user_id

    end
  end
end
