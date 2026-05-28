MsgBox, 4, Open CMD, Do you want to open CMD as admin?
IfMsgBox Yes
{
    Run, *RunAs cmd.exe
} else
{
    run cmd.exe
}