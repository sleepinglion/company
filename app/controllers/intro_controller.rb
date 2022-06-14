class IntroController < ApplicationController
  def before_init
    super
    @page_itemtype = 'http://schema.org/AboutPage'
    @title = t(:menu_intro)
  end

  def company
    @controller_name = t(:menu_intro)
    @title = t(:submenu_intro1)
  end

  def service
    @controller_name = t(:menu_intro)
    @title = t(:submenu_intro2)
  end

  def program
    @controller_name = t(:menu_intro)
    @title = t(:submenu_intro3)
  end
end
