module Refinery
  module Careers
    module Admin
      class CareersController < Refinery::AdminController

        crudify :'refinery/careers/career', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_careers
          else
            search_all_careers
          end

          @grouped_careers = group_by_date(@careers)
        end

      end
    end
  end
end
