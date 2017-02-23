class MouseSwitch
  def self.switch_check is_right_handed
    @@lefthanded.always_show_image= is_right_handed==0
    @@righthanded.always_show_image= is_right_handed==1
  end

  require 'gtk3'
  require File.dirname(__FILE__) + '/mouse_status_modify.rb'
  Gtk::Settings.default.gtk_font_name="Microsoft YaHei Light 9"
  Gtk::UIManager.new
  si = Gtk::StatusIcon.new
  trayicon=GdkPixbuf::Pixbuf.new :file => 'TrayIcon.png'
  si.set_pixbuf trayicon

  menu = Gtk::Menu.new
  quit = Gtk::ImageMenuItem.new
  quit.label='退出'
  @@lefthanded=Gtk::ImageMenuItem.new :label => '左手鼠'
  @@righthanded=Gtk::ImageMenuItem.new :label => '右手鼠'
  @@lefthanded.image=Gtk::Image.new(:file => 'check.png')
  @@righthanded.image=Gtk::Image.new(:file => 'check.png')
  is_right_handed=MouseStatusModify.check_mouse_state
  switch_check is_right_handed

  @@lefthanded.signal_connect('activate'){
    MouseStatusModify.switch_mouse_habit 0
    switch_check 0
  }
  @@righthanded.signal_connect('activate'){
    MouseStatusModify.switch_mouse_habit 1
    switch_check 1
  }

  quit.signal_connect('activate'){ Gtk.main_quit }
  menu.append(@@lefthanded)
  menu.append(@@righthanded)
  menu.append(quit)
  menu.show_all
  si.signal_connect('popup-menu') do |icon, button, time|
    menu.popup(nil, nil, button, time)
  end
  Gtk.main


end