class RemoveNameFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :name, :string
  end
end
