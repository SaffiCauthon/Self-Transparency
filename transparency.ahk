;-------------------------------------------------------------------------------
; \file     transparency.ahk
; \brief    Stolen from GitHub gist, modified to my code style.
; \author   --
; \date     26.01.2023 (dd/mm/yy)
; \version  2.00.00
; \project  Self-Transparency
;-------------------------------------------------------------------------------

#SingleInstance, Force      ; Make sure that only one *.ahk is running
SetWinDelay 0               ; Set delay after each windowing command
SetControlDelay 0           ; Set delay after each control-modifying command

!a::                                        ; Alt-A: Toggle (A)lways on top
    Winset, Alwaysontop, Toggle, A          ; Uses A(ctive window)
    return

!WheelUp::                                  ; Alt-MouseWheel_Up
    DetectHiddenWindows, On                 ; Invisible windows are "seen"
    
    WinGet, old, Transparent, A             ; Get active window alpha value
    
    if (! old)                              ; Variable has not been initialized
    {
        old = 255                           ; Initialize to most opaque
    }
    
    new := old + 8                          ; Decrease transparency by 1/32
    
    if (new > 0)                            ; Set new transparency value
    {
        WinSet, Transparent, %new%, A
    }
    else
    {
        WinSet, Transparent, OFF, A
        WinSet, Transparent, 255, A
    }
    return

!WheelDown::                                ; Alt-MouseWheel_Down
    DetectHiddenWindows, On                 ; Invisible windows are "seen"

    WinGet, old, Transparent, A             ; Get active window alpha value
    
    if (! old)                              ; Variable has not been initialized
    {
        old = 255                           ; Initialize to most opaque
    }

    new := old - 8                          ; Increase transparency by 1/32
    
    if new > 0                              ; Set new transparency value
    {
        WinSet, Transparent, %new%, A
    }
    return

!o::                                        ; Alt-O
    WinSet, Transparent, 25, A              ; Set active window alpha to 10%
    return

!+o::                                       ; Shift-Alt-O
    WinSet, Transparent, 255, A             ; Reset active window alpha to 100%
    WinSet, Transparent, OFF, A
    return