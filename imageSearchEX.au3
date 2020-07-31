#include <screencapture.au3>
#include <array.au3>
#include <GUIConstantsEx.au3>
#include <Constants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <BmpSearch.au3>
#include <GDIPlus.au3>
Func imageSearchEX($hwnd,$bmpLocal)
   $iWidth = _WinAPI_GetWindowWidth($hwnd)
   $iHeight = _WinAPI_GetWindowHeight($hwnd)
   Return imageSearchEXarea($hwnd,$bmpLocal,$iWidth,$iHeight)
   EndFunc
Func imageSearchEXarea($hwnd,$bmpLocal,$iWidth,$iHeight)
   Local $p[2]
_GDIPlus_Startup()
;Get the hBitmap of the image i want to search for
$Bitmap = _GDIPlus_BitmapCreateFromFile($bmpLocal)
$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Bitmap)

;Doing the actual window capture and saving it inside $hBMP
$iWidth = _WinAPI_GetWindowWidth($hwnd) ; $browser = the handle of the window which I am capturing
$iHeight = _WinAPI_GetWindowHeight($hwnd)
$hDDC = _WinAPI_GetDC($hwnd)
$hCDC = _WinAPI_CreateCompatibleDC($hDDC)
$hBMP = _WinAPI_CreateCompatibleBitmap($hDDC, $iWidth, $iHeight)
_WinAPI_SelectObject($hCDC, $hBMP)
DllCall("User32.dll", "int", "PrintWindow", "hwnd", $hwnd, "hwnd", $hCDC, "int", 0)
;Searching for the image
$pos = _BmpSearch($hBMP, $hBitmap,10)
if $pos=0 Then
   Return 0
   EndIf
$p[0]=$pos[1][2]
$p[1]=$pos[1][3]
;delete resources
 _WinAPI_ReleaseDC($hwnd, $hDDC)
_WinAPI_DeleteDC($hCDC)
_WinAPI_DeleteObject($hBMP)
_GDIPlus_Shutdown()
Return $p
EndFunc