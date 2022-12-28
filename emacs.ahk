;;
;; An autohotkey script (v2 compliant) that allows you to use minimam emacs-like key bindings on Windows
;;
#UseHook
InstallKeybdHook
;SetKeyDelay 0 ;; needed? 

passthrough_processes := ["example.exe"]

For p in passthrough_processes {
  GroupAdd "Untargetted", "ahk_exe "
}

#HotIf not WinActive("ahk_group Untargetted") 
;#SuspendExempt
^q::{ ; pass through next key (temprarily diable hotkeys)
  Suspend
  ih := InputHook("L1 M")
  ih.Start()
  ih.Wait()
  Send(ih.Input)
  Suspend(0)
}
;#SuspendExempt False

^b::Send "{Left}" 
^f::Send "{Right}"
^p::Send "{Up}"
^n::Send "{Down}"

^a::Send "{Home}"
^e::Send "{End}"

^d::Send "{Delete}"
^k::{
  Send "{ShiftDown}{END}{SHIFTUP}"
  Sleep 50 ;[ms] this value depends on your environment  
  Send "^x"
}
#HotIf
