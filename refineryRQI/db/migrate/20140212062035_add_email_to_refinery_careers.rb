class AddEmailToRefineryCareers < ActiveRecord::Migration
  def change
    add_column :refinery_careers, :email, :string
  end
end
