num_on := 0
caps_on := 0
scroll_on := 0
num_down := 0
caps_down := 0
scroll_down := 0



;                   ;
; ==== OPTIONS ==== ;
;                   ;

initial_sleep_time := 0

startup_path := "C:\Users\RandomPersson\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup_optional\"

school := ["Teams", "Skype"]
browsers := ["Firefox", "Google Chrome"]
online := ["Mozilla Thunderbird", "Steam", "Discord"]
base := ["Core Temp", "GPU-Z", "MicMute", "Notepad++"]

start_school := &caps_on
start_browsers := &scroll_on
start_online := &num_on

stop_everything := &scroll_down

;                   ;
; ---- OPTIONS ---- ;
;                   ;



sleep, %initial_sleep_time%

num_on := GetKeyState("NumLock", "T")
caps_on := GetKeyState("CapsLock", "T")
scroll_on := GetKeyState("ScrollLock", "T")
num_down := GetKeyState("NumLock", "P")
caps_down := GetKeyState("CapsLock", "P")
scroll_down := GetKeyState("ScrollLock", "P")

if (strget(stop_everything)) {
  ExitApp
}

run F:\RandomPersson\Files\Code\CMD\connection_check.bat
; WinWait ahk_class, "Command Prompt", 0
; WinActivate "Command Prompt"
; WinMove A,, -401, -703

SendInput ^+{Esc}

for index, element in base {
  run, %startup_path%%element%.lnk, %startup_path%
}

if (strget(start_online)) {
  for index, element in online {
    run, %startup_path%%element%.lnk, %startup_path%
  }
}

if (strget(start_browsers)) {
  for index, element in browsers {
    run, %startup_path%%element%.lnk, %startup_path%
  }
}

if (strget(start_school)) {
  for index, element in school {
    run, %startup_path%%element%.lnk, %startup_path%
  }
}

ExitApp
