# RandomizedID

require 'digest/sha1'

module RandomizedID
  def self.included base
    super
    base.class_eval do
      include InstanceMethods
      before_create :randomize_id
    end
  end

  module InstanceMethods
    def randomize_id
      id_candidate = rand(1<<31)
      id_candidate = rand(1<<31) while send(:class).where(:id => id_candidate).count > 0
      write_attribute(:id, id_candidate)
    end
  end
end
