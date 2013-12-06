class Match < ActiveRecord::Base
  belongs_to :contest
  belongs_to :referee
  belongs_to :manager, polymorphic: true
  has_many :players, through: :player_matches
  has_many :player_matches
  validates :manager, presence: true
  validates :status, presence: true
  validates_date :completion, :on_or_before => lambda { Time.now.change(:usec =>0) }, :if => :checkfuturethings
  validates_datetime :earliest_start, :if => :checkthings
  
  
  validate :num_players
  
  def num_players
    if self.players && self.manager
      if self.players.count != self.manager.referee.players_per_game
        errors.add(:player_matches,"wrong number of players!")
      end
    end
  end
  
  
  def checkfuturethings
    if self.status != "Completed"
      return nil
    else
      return true
    end
  end
  
  def checkthings
    if self.status=="Completed" 
      return nil
    elsif self.status=="Started"
      return nil
    else
      return true
    end
  end
  
  
 
  
end