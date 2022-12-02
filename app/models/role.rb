class Audition < ActiveRecord::Base
  has_many :audtions

  def actors
    auditions.map {|a| a.actor}
  end

  def locations
    audtions.map {|a| a.location}
  end

  def lead
    auditions.find_by(hired: true) || 'no actor has been hired for this role'
  end

  def understudy
    audtions.where(hired: true).second || 'no actor has been hired for understudy for this role'
  end
end