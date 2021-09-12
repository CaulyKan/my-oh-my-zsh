function prompt {
$ESC = [char]27
"`n$ESC[36m# " + $(whoami) + "$ESC[0m @ $ESC[32m" + $env:COMPUTERNAME + "$ESC[0m in $ESC[33m" + $(pwd) + " $ESC[0m[" + $(Get-Date) + "]`n$ESC[31mPS> $ESC[0m"
}
