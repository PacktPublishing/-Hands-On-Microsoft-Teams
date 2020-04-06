#Connect to Microsoft Teams 
Connect-MicrosoftTeams

#Get all Teams
$allTeams = Get-Team

#Loop through all teams 
for ($i=0; $i -lt $allTeams.length; $i++) {	
	#Get each team group id and define the fun settings 
	$groupId = $allTeams[$i].GroupId
	Set-Team -GroupId $groupId -AllowGiphy $true -GiphyContentRating moderate -AllowStickersAndMemes $true -AllowCustomMemes $true
}

