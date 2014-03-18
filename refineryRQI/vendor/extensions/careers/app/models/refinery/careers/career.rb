module Refinery
  module Careers
    class Career < Refinery::Core::BaseModel
      self.table_name = 'refinery_careers'

      attr_accessible :name, :position, :message, :cv_id, :position, :email

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true

      belongs_to :cv, :class_name => 'Refinery::Resource'
    end
  end
end
