rem Use UTC clock, run as admin
rem based on https://www.cl.cam.ac.uk/~mgk25/mswish/ut-rtc.html

reg add HKLM\System\CurrentControlSet\Control\TimeZoneInformation /t REG_DWORD /v RealTimeIsUniversal /d 1
reg query HKLM\System\CurrentControlSet\Control\TimeZoneInformation /s
pause
