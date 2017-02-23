@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit
:begin
::下面是你自己的代码。
ruby C:\Users\Lynn\IdeaProjects\MouseHandedQuickSwitch\mouse_switch.rb
