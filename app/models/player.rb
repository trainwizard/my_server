class Player < ActiveRecord::Base
  belongs_to :users
  belongs_to :contest
end
