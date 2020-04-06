#Team owner and new channel name definition 
$teamOwnerEmail = "john@funskating.com"
$channelName = "Covid 19"

#Connect to Microsoft Teams and get all the teams where the user belongs, this will include the teams where the user is owner and member
Connect-MicrosoftTeams
$teamsWhereIam = Get-Team -User $teamOwner

#Loop through all the teams 
for ($i=0; $i -lt $teamsWhereIam.length; $i++) {
	#Get the current team Group Id and list of owners 
	$groupId = $teamsWhereIam[$i].GroupId
	$teamOwners = Get-TeamUser -GroupId $groupId -Role Owner
	#Loop through the owners of the team 
	for ($j=0; $j -lt $teamOwners.length; $j++) {
		#Compare the current owner of the team with the email defined at the top of the script, if the condition is true it means that the current team is owned by John and a new channel is then created on it
		if($teamOwners[$j].User -eq $teamOwnerEmail){
			New-TeamChannel -GroupId $groupId -DisplayName $channelName
		}
	}
}

