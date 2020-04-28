#1
Connect-MicrosoftTeams
#2
$allTeams = Get-Team
#3
for ($i=0; $i-lt$allTeams.length; $i++) {
	#4
	$groupId=$allTeams[$i].GroupId
	Set-Team –GroupId $groupId –AllowGiphy $true –GiphyContentRating moderate –AllowStickersAndMemes $true –AllowCustomMemes $true
}
Disconnect-MicrosoftTeams