class AddCvLinkToRefineryCareers < ActiveRecord::Migration
  def change
    add_column :refinery_careers, :cv_link, :string
  end
end
