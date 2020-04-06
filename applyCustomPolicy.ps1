#Authentication using Skype for Business PowerShell module, this process will open a windows authentication popup where you must introduce your credentials
Import-Module SkypeOnlineConnector
$credentials = Get-Credential
$sfbSession = New-CsOnlineSession -Credential $credentials
Import-PSSession $sfbSession

#Users definition, this is the list of users to whom the new app setup policy will be applied 
$usersEmails = @("francisca@handsonsp.onmicrosoft.com","francisco@handsonsp.onmicrosoft.com")

#Loop thorough the list of users and apply the Company App policy
for ($i=0; $i -lt $usersEmails.length; $i++) {	
	Grant-CsTeamsAppSetupPolicy -identity $usersEmails[$i] -PolicyName "Custom Apps"
}
