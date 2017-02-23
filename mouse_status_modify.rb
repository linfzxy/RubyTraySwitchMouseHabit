# from http://wjason.iteye.com/blog/1884353
class MouseStatusModify
  require "Win32API"
  require 'win32/registry'
  def self.switch_mouse_habit targetStatus
    Win32API.new('user32.dll', 'SwapMouseButton',['L'], 'L').call(targetStatus)
  end
  def self.check_mouse_state
    sm_swapbutton = 23 # public const int SM_SWAPBUTTON = 23;
    mouseStatus = Win32API.new('user32.dll', 'GetSystemMetrics',['L'], 'L').call(sm_swapbutton)
    return mouseStatus
  end
end