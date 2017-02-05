class Fence < ActiveRecord::Base

	belongs_to :ad

  def self.validate_fence(radius,lat,lng)

    if radius.to_f <100 || radius.to_f >10000
      logger.info "not in range"
    return false
    end

    if radius.to_f.is_a?(Numeric) == false
      logger.info "invalid format"
    return false
    end

    if lat.blank? || lng.blank?
      logger.info "blank lat or long"
    return false
    end

    return true
  end

end
