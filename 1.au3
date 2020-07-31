#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

;~ UpdateSizeAndPosition()
ActiveWindow()

MsgBox(0, "Done", "Done")

#comments-start
While true
   Sleep(1000)
   ;MouseClick("left", 5, 5)
   Sleep(500)
   ControlClick("","","", "right", 1, 20, 20)
   MsgBox(0, "Clicked", "clicked")
   Sleep(5000)
WEnd
#comments-end

Func GetPosition()
    ; Retrieve the position as well as height and width of the active window.
    $hWna= WinGetHandle("0x00000000000304D0", "")

	Local $aPos = WinGetPos($hWna)

    ; Display the array values returned by WinGetPos.
    MsgBox(0, "", "X-Pos: " & $aPos[0] & @CRLF & _
            "Y-Pos: " & $aPos[1] & @CRLF & _
            "Width: " & $aPos[2] & @CRLF & _
            "Height: " & $aPos[3])
EndFunc   ;==>Example

Func UpdateSizeAndPosition()
   $AllWindows = WinList("Nhan Gia Vo Song 3D")
   $DeskSize = WinGetPos("Program Manager")
   if $AllWindows[0][0] == 1 Then
	  WinMove($AllWindows[1][1], "", 0, 0, $DeskSize[2], $DeskSize[3])
   ElseIf $AllWindows[0][0] == 2 Then
	  WinMove($AllWindows[1][1], "", 0, 0, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[2][1], "", $DeskSize[2]/2, $DeskSize[3]/2, $DeskSize[2]/2, $DeskSize[3]/2)
   ElseIf $AllWindows[0][0] == 3 Then
	  WinMove($AllWindows[1][1], "", 0, 0, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[2][1], "", $DeskSize[2]/2, $DeskSize[3]/2, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[3][1], "", $DeskSize[2]/2, 0, $DeskSize[2]/2, $DeskSize[3]/2)
   ElseIf $AllWindows[0][0] == 4 Then
	  WinMove($AllWindows[1][1], "", 0, 0, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[2][1], "", $DeskSize[2]/2, $DeskSize[3]/2, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[3][1], "", $DeskSize[2]/2, 0, $DeskSize[2]/2, $DeskSize[3]/2)
	  WinMove($AllWindows[4][1], "", 0, $DeskSize[3]/2, $DeskSize[2]/2, $DeskSize[3]/2)
   EndIf
EndFunc

Func ActiveWindow()
   $AllWindows = WinList("Nhan Gia Vo Song 3D")
   $Count = $AllWindows[0][0]
   MsgBox(0, "$Count", $Count)
   For $i = 1 To $Count
	  $Window = $AllWindows[$i][1]
	  WinActivate($Window)
	  Sleep(50)
	  ControlClick($Window,"","", "left", 1)
	  Sleep(1000)
   Next
EndFunc