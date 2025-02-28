-- Prompt user for input
set userName to text returned of (display dialog "Enter the username:" default answer "")
set userPassword to text returned of (display dialog "Enter the user password:" default answer "" with hidden answer)
set adminUser to text returned of (display dialog "Enter the admin username:" default answer "")
set adminPassword to text returned of (display dialog "Enter the admin password:" default answer "" with hidden answer)


-- Check if secure token is enabled
set secureTokenStatus to do shell script "sysadminctl -secureTokenStatus " & userName & " 2>&1"

if secureTokenStatus contains "ENABLED" then
	set userToken to true
else
	set userToken to false
end if


-- Perform actions based on userToken value
if userToken is true then
	set result to do shell script "sysadminctl -secureTokenOff " & userName & " -password " & userPassword & " -adminUser " & adminUser & " -adminPassword " & adminPassword
end if

delay 5
set result to do shell script "sysadminctl -secureTokenOn " & userName & " -password " & userPassword & " -adminUser " & adminUser & " -adminPassword " & adminPassword

delay 5
set result to do shell script "diskutil apfs UpdatePreboot /"

set secureTokenStatus to do shell script "sysadminctl -secureTokenStatus " & userName & " 2>&1"



-- Get current secureToken Status
set secureTokenStatusFinal to do shell script "sysadminctl -secureTokenStatus " & userName & " 2>&1"


-- Display the result in a dialog
display dialog "Secure Token Status: " & secureTokenStatusFinal


return 0
