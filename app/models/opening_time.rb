class OpeningTime < ActiveRecord::Base
  belongs_to :store
  attr_accessible :end_time, :start_time, :weekday

  validates_presence_of :store
  validates_presence_of :weekday
  validates_presence_of :start_time
  validates_presence_of :end_time

  validate :time_period

  def self.weekdays_hash
    {
      "Sunday"   => 0,
      "Monday"   => 1,
      "Tuesday"  => 2,
      "Wednesday"=> 3,
      "Thursday" => 4,
      "Friday"   => 5,
      "Saturday" => 6
    }
  end

  def formatted_day
    OpeningTime.weekdays_hash.each do |key, value|
      return key if value == weekday
    end
  end

  def formatted_start
    start_time.to_s(:time)
  end

  def formatted_end
    end_time.to_s(:time)
  end

  private

  def time_period
    if start_time.present? && end_time.present? && start_time > end_time
      errors.add(:end_time, "End time should follow start time")
    end
  end
end
