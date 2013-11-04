class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_point_sum


  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  validates :karma_point_sum,
            :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}

  def self.by_karma
    User.order('karma_point_sum DESC')
  end

  def total_karma
    self.karma_point_sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_karma_point_sum
    p user_karma = self.total_karma
    self.update_attribute(:karma_point_sum, user_karma)
  end
end
