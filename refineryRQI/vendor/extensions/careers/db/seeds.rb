Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.find_by_name('careers').nil?
        user.plugins.create(:name => "careers",
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  if defined?(Refinery::Page)
    page = Refinery::Page.create(
      :title => "Careers",
      :link_url => "/careers/new",
      :deletable => false,
      :menu_match => "^/careers(\/|\/.+?|)$"
    )
    thank_you_page = page.children.create(
      :title => "Thank You",
      :link_url => "/careers/thank_you",
      :deletable => false,
      :show_in_menu => false
    )
    Refinery::Pages.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
      thank_you_page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end
