# RandomizedID

require 'digest/sha1'

module RandomizedID
  def self.included base
    super
    base.class_eval do
      include InstanceMethods
      # extend ClassMethods
      before_create :randomize_id
    end
  end

  module InstanceMethods
    def randomize_id
      id_candidate = rand(1<<31)
      id_candidate = rand(1<<31) while self.class.count(:conditions => { :id => id_candidate }) > 0
      self.id = id_candidate
    end
  end

  # module ClassMethods
  # end
end
