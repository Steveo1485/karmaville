class AddKarmaPointSumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_point_sum, :integer, :default => 0
  end
end
