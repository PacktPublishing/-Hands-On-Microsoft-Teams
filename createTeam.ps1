#Team settings
$teamName = "Project Y"
$teamDescription = "The new generation of electric skateboards"
$teamOwner = "joao@handsonsp.onmicrosoft.com"
$teamVisibility = "Private"
$teamEditMessagesPolicy = $false
$teamDeliteMessagesPolicy = $false

#Team default channels
$teamChannels = @("Procedures", "Legal")

#Team default members
$teamMembers = @("francisca@handsonsp.onmicrosoft.com", "adele@funskating.com")

#Establish a connection to Microsoft Teams, using this cmdlet without parameters will open a login popup and will authenticate you in your organization tenant
Connect-MicrosoftTeams

#Team creation, the result is being saved into a variable to use the Group Id in the following instructions
$teamDetails = New-Team -DisplayName $teamName -Description $teamDescription -Owner $teamOwner -Visibility $teamVisibility -AllowUserEditMessages $teamEditMessagesPolicy -AllowOwnerDeleteMessages $teamDeliteMessagesPolicy

#Channel creation, this loops through the channel list to create the channel. The Group Id was saved on the New-Team instruction
for ($i=0; $i -lt $teamChannels.length; $i++) {
	New-TeamChannel -GroupId $teamDetails.GroupId -DisplayName $teamChannels[$i]
}

#Add default members to the team, this loops through the array of users and add them to the team as members
for ($i=0; $i -lt $teamMembers.length; $i++) {
	Add-TeamUser -GroupId $teamDetails.GroupId -User $teamMembers[$i] -role "Member"
}