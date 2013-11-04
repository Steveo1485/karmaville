namespace :db do
  desc "Calculate karma point sum for users"
  task :karma_point_sum => :environment do
    User.all.each do |user|
      p "Updating for User: #{user.id}"
      user.update_karma_point_sum
    end
  end
end
