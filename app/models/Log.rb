class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :booking
  
  field :booking_id, type: String
  field :action, type: String
  field :body, type: String
  
  validates :booking_id, presence: true

  def self.create_log(booking, action, body)
    if !booking.nil?
      log = Log.create(booking: booking, action: action, body: body)
    end
  end
end