class Referee < ActiveRecord::Base
  belongs_to :user
  has_many :contests
  has_many :matches, as: :manager
  
  def upload=(uploaded_file)
    if uploaded_file.nil?
    else 
      time_no_spaces = Time.now.to_s.gsub(/ /, '_')
      file_location = Rails.root.join('code', 'referees', Rails.env, user.id.to_s + time_no_spaces).to_s
      IO::copy_stream(uploaded_file, file_location.to_s)
      uploaded_file.read
    end #end if uploaded
    self.file_location = file_location
  end # end upload
end #end class