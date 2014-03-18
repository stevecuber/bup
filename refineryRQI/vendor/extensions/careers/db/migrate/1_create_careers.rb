class CreateCareers < ActiveRecord::Migration

  def up
    create_table :refinery_careers do |t|
      t.string :name
      t.string :position
      t.text :message
      t.integer :cv_id

      t.timestamps
    end

    add_index :refinery_careers, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "careers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/careers"})
    end

    drop_table :refinery_careers
  end

end
