#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <WinAPI.au3>
#Region ### START Koda GUI section ### Form=C:\Users\muddu_bbz1k23\Documents\autotyper.kxf
$autotyper_1 = GUICreate("AutoBotV1", 431, 208, -1, -1)
$autohandle = WinGetHandle($autotyper_1)
GUISetCursor(2)
$Tab1 = GUICtrlCreateTab(0, 0, 425, 201)
$TabSheet1 = GUICtrlCreateTabItem("AutoTyper")
$autostart = GUICtrlCreateButton("Start Autotyper", 4, 25, 115, 41)
GUICtrlSetFont(-1, 10, 400, 0, "Comic Sans")
GUICtrlSetCursor(-1, 0)
$exitbutt = GUICtrlCreateButton("ESC", 212, 145, 91, 25)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$RunText = GUICtrlCreateEdit("", 4, 105, 185, 89, BitOR($GUI_SS_DEFAULT_EDIT, $ES_CENTER))
GUICtrlSetData(-1, "Enter Text Here:")
GUICtrlSetFont(-1, 8, 800, 4, "Arial")
$winname = GUICtrlCreateInput("Window Name:", 4, 73, 113, 24, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
$Label1 = GUICtrlCreateLabel("Made by Sen", 260, 177, 83, 17)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
$charbut = GUICtrlCreateButton("SPECIAL CHARS", 124, 65, 107, 33)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetCursor(-1, 0)
$Label2 = GUICtrlCreateLabel("V1", 340, 145, 24, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Group1 = GUICtrlCreateGroup("Settings", 236, 23, 137, 121)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$runtemp = GUICtrlCreateCheckbox("Run For:", 244, 41, 97, 17)
$runfvr = GUICtrlCreateCheckbox("Run Forever", 244, 57, 97, 17)
$runtime = GUICtrlCreateInput("RUN FOR:", 244, 113, 121, 22, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$interval = GUICtrlCreateInput("INTERVAL:", 244, 81, 121, 22, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$tutorial = GUICtrlCreateButton("TUTORIAL", 124, 31, 107, 33)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetCursor(-1, 4)
$TabSheet2 = GUICtrlCreateTabItem("AutoClicker")
$clickstart = GUICtrlCreateButton("START AUTOCLICKER", 12, 31, 225, 65)
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
GUICtrlSetCursor(-1, 0)
$Group2 = GUICtrlCreateGroup("Button Selection", 4, 103, 241, 81)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$leftc = GUICtrlCreateRadio("Left Click", 12, 127, 113, 17)
$rightc = GUICtrlCreateRadio("Middle Button", 68, 159, 137, 17)
$middlec = GUICtrlCreateRadio("Right Click", 132, 119, 113, 33)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Settings", 252, 23, 161, 161)
GUICtrlSetFont(-1, 12, 400, 0, "Arial")
$interm = GUICtrlCreateInput("INTERVAL:", 260, 111, 145, 26)
$runform = GUICtrlCreateInput("RUN FOR:", 260, 151, 145, 26, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$runforcm = GUICtrlCreateCheckbox("Run For:", 260, 47, 97, 17)
$runfvrc = GUICtrlCreateCheckbox("Run Forever", 260, 79, 105, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
$runtemp_Handle = GUICtrlGetHandle($runtime)
GUISetState(@SW_SHOWNOACTIVATE)
GUISetState(@SW_LOCK)
HotKeySet("{Esc}", "ExitScript")
$tempstyle = _WinAPI_GetWindowLong($runtemp_Handle, $GWL_STYLE)
$constyle = $tempstyle
$mousehandle = GUICtrlGetHandle($runform)
$mousestyle = _WinAPI_GetWindowLong($mousehandle, $GWL_STYLE)
$constylem = $mousestyle
Global $construn = True
Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
#EndRegion ### END Koda GUI section ###
GUIRegisterMsg($WM_COMMAND, "_WM_COMMAND")
While 1
	If GUICtrlRead($runfvr) = $GUI_CHECKED Then
		GUICtrlSetState($runtemp, $GUI_UNCHECKED)
		If $tempstyle == $constyle Then
			GUICtrlSetStyle($runtime, BitOR($tempstyle, $ES_CENTER, $ES_READONLY))
			$tempstyle = _WinAPI_GetWindowLong($runtemp_Handle, $ES_READONLY)
			GUICtrlSetData($runtime, "RUN FOR:")
		EndIf
	EndIf
	If GUICtrlRead($runtemp) = $GUI_CHECKED Then
		GUICtrlSetState($runfvr, $GUI_UNCHECKED)
		If $tempstyle <> $constyle Then
			GUICtrlSetStyle($runtime, $constyle)
			$tempstyle = _WinAPI_GetWindowLong($runtemp_Handle, $GWL_STYLE)
		EndIf
	EndIf
	If GUICtrlRead($runfvrc) = $GUI_CHECKED Then
		GUICtrlSetState($runforcm, $GUI_UNCHECKED)
		If $mousestyle == $constylem Then
			GUICtrlSetStyle($runform, BitOR($mousestyle, $ES_READONLY))
			$mousestyle = _WinAPI_GetWindowLong($mousehandle, $ES_READONLY)
			GUICtrlSetData($runform, "RUN FOR:")
		EndIf
	EndIf
	If GUICtrlRead($runforcm) = $GUI_CHECKED Then
		GUICtrlSetState($runfvrc, $GUI_UNCHECKED)
		If $mousestyle <> $constylem Then
			GUICtrlSetStyle($runform, $constylem)
			$mousestyle = _WinAPI_GetWindowLong($mousehandle, $GWL_STYLE)
		EndIf
	EndIf
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Send("{ESC")
		Case $exitbutt
			Send("{ESC}")
			Exit
		Case $charbut
			ShellExecute("https://www.autoitscript.com/autoit3/docs/functions/Send.htm#:~:text=N.B.%20Windows%20does%20not%20allow%20the,new%20menu%20or%20collapse%20a%20submenu.")
		Case $autostart
			$sendinfo = GUICtrlRead($RunText)
			WinActivate(GUICtrlRead($winname))
			$inter = GUICtrlRead($interval)
			$runt = GUICtrlRead($runtime)
			$text = GUICtrlRead($RunText)
			WinSetState("AutoTyper", "", @SW_SHOWNA)
			If Number($inter) > 0 Then
				$construn = True
				If GUICtrlRead($runfvr) = $GUI_CHECKED Then
					While 1
							Send($text)
							If $construn = 0 Then
								Exit
							EndIf
							Sleep(Number($inter) * 1000)
					WEnd
				ElseIf GUICtrlRead($runtemp) = $GUI_CHECKED Then
					If (Number($runtemp) <> 0) Then
						For $x = 1 To Number($runt)
							Send($text)
							Sleep(Number($inter) * 1000)
						Next
					Else
						MsgBox($MB_OK, "Error", "Remember to enter a valid number in the RUN FOR: field!", 0)

					EndIf
				EndIf
			ElseIf Number($inter) == 0 Then
				MsgBox($MB_OK, "Error", "Remember to enter a valid interval!", 0, $autohandle)
			EndIf
			ExitLoop
		Case $clickstart
			If GUICtrlRead($leftc) Then
				$click = $MOUSE_CLICK_LEFT
			ElseIf GUICtrlRead($rightc) Then
				$click = $MOUSE_CLICK_RIGHT
			ElseIf GUICtrlRead($middlec) Then
				$click = $MOUSE_CLICK_MIDDLE
			EndIf
			If GUICtrlRead($runforcm) = $GUI_CHECKED Then
				For $y = 1 To Number(GUICtrlRead($runform))
					MouseClick($click)
					Sleep(Number(GUICtrlRead($interm)) * 1000)
				Next
			ElseIf GUICtrlRead($runfvrc) = $GUI_CHECKED Then
				While 1
					MouseClick($click)
					Sleep(Number(GUICtrlRead($interm)) * 1000)
				WEnd
			EndIf
			Exit
		Case $tutorial
			Call("_tutorialGUI")
			Exit
	EndSwitch
WEnd
;=================================================== Tutorial GUI
Func _WM_COMMAND($hWnd, $Msg, $wParam, $lParam)
    If BitAND($wParam, 0x0000FFFF) =  $exitbutt Then $construn = 0
    Return $GUI_RUNDEFMSG
EndFunc
Func _tutorialGUI()
	$tutorial = GUICreate("Help", 405, 293, 302, 218)
	GUISetIcon("help_tkO_icon.ico")
	$Icon1 = GUICtrlCreateIcon("auto_Wbx_icon.ico", -1, 8, 8, 64, 64)
	$textasdd = GUICtrlCreateLabel("AutoBot Help", 128, 16, 162, 36)
	GUICtrlSetFont(-1, 20, 400, 0, "MS Sans Serif")
	$Group1 = GUICtrlCreateGroup("Settings Help", 8, 80, 185, 193)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$Label1 = GUICtrlCreateLabel("INTERVAL: Pause between action", 16, 104, 169, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label2 = GUICtrlCreateLabel("RUN FOR: How long you want the", 16, 128, 168, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label3 = GUICtrlCreateLabel("program to run. Required if Run For:", 16, 144, 173, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label4 = GUICtrlCreateLabel("Run Forever: Runs program forever.", 16, 176, 174, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label5 = GUICtrlCreateLabel("The INTERVAL: is required.", 16, 192, 136, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label6 = GUICtrlCreateLabel("Run For: If you want to specify the", 16, 224, 166, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group2 = GUICtrlCreateGroup("Mouse Buttons", 200, 208, 193, 65)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$Label12 = GUICtrlCreateLabel("Allows you to choose mouse button to", 208, 232, 183, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label13 = GUICtrlCreateLabel("click.", 208, 248, 29, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group3 = GUICtrlCreateGroup("Window Name && Misc", 200, 80, 201, 129)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	$Label8 = GUICtrlCreateLabel("Window Name: Chooses window to ", 208, 96, 175, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label9 = GUICtrlCreateLabel("select. Only first few chars. required.", 208, 112, 174, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label10 = GUICtrlCreateLabel("SPECIAL CHARS: Opens a list of ", 208, 136, 164, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label11 = GUICtrlCreateLabel("commands the autotyper can send", 208, 152, 167, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label14 = GUICtrlCreateLabel("in the browser.", 208, 168, 73, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	$Label15 = GUICtrlCreateLabel("QUIT: Hit Esc key on keyboard.", 208, 184, 159, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Label7 = GUICtrlCreateLabel("program run time.", 16, 240, 85, 17)
	GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	While 1
		$newMsg = GUIGetMsg()
		Switch $newMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($tutorial)
				GUIDelete($autotyper_1)
				ProcessClose("AutoBotV1")
				ShellExecute("AutoBotV1.exe")
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>_tutorialGUI