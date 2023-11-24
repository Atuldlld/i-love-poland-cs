GM.Name 	= "Counter-Strike Mini"
GM.Author 	= "oTvErTkA"
GM.Email 	= ""
GM.Website 	= "https://steamcommunity.com/groups/thealium"
GM.Help		= ""



GM.Data = {}

DeriveGamemode( "fretta15" )


IncludePlayerClasses()					-- Automatically includes files in "gamemode/player_class"

GM.TeamBased = true					-- Team based game or a Free For All game?
GM.AllowAutoTeam = true
GM.AllowSpectating = true
GM.SelectClass = true
GM.SecondsBetweenTeamSwitches = 30
GM.GameLength = 200
GM.RoundLimit = 200					-- Maximum amount of rounds to be played in round based games
GM.VotingDelay = 200					-- Delay between end of game, and vote. if you want to display any extra screens before the vote pops up

GM.NoPlayerSuicide = false
GM.NoPlayerDamage = false
GM.NoPlayerSelfDamage = false		-- Set to true to prevent players from taking damage from themselves (ie. grenades).
GM.NoPlayerTeamDamage = true		-- Set to true to prevent team damage.
GM.NoPlayerPlayerDamage = false 	-- Set to true to prevent player vs. player damage.
GM.NoNonPlayerPlayerDamage = false 	-- Set to true to prevent players from taking damage from non-players.
GM.NoPlayerFootsteps = false		-- When true, all players have silent footsteps
GM.PlayerCanNoClip = false			-- When true, players can use noclip without sv_cheats
GM.TakeFragOnSuicide = true			-- -1 frag on suicide

GM.MaximumDeathLength = 360			-- Player will respawn if death length > this (can be 0 to disable)
GM.MinimumDeathLength = 360			-- Player has to be dead for at least this long
GM.AutomaticTeamBalance = false      -- Teams will be periodically balanced
GM.ForceJoinBalancedTeams = true	-- Players won't be allowed to join a team if it has more players than another team
GM.RealisticFallDamage = true		-- Set to true to use realistic fall damage instead of the fixed 10 damage.
GM.AddFragsToTeamScore = false		-- Adds player's individual kills to team score (must be team based)

GM.NoAutomaticSpawning = false		-- Players don't spawn automatically when they die, some other system spawns them
GM.RoundBased = true				-- Round based, like CS
GM.RoundLength = 300				-- Round length, in seconds
GM.RoundPreStartTime = 3			-- Preperation time before a round starts
GM.RoundPostLength = 5				-- Seconds to show the 'x team won!' screen at the end of a round
GM.RoundEndsWhenOneTeamAlive = true	-- CS Style rules

GM.EnableFreezeCam = false			-- TF2 Style Freezecam
GM.DeathLingerTime = 3				-- The time between you dying and it going into spectator mode, 0 disables

GM.SelectModel = false               -- Can players use the playermodel picker in the F1 menu?
GM.SelectColor = false				-- Can players modify the colour of their name? (ie.. no teams)

GM.PlayerRingSize = 48              -- How big are the colored rings under the player's feet (if they are enabled) ?
GM.HudSkin = "SimpleSkin"

GM.SuicideString = "Самовыпилился"

GM.ValidSpectatorModes = { OBS_MODE_CHASE, OBS_MODE_IN_EYE }
GM.ValidSpectatorEntities = { "player" }	-- Entities we can spectate
GM.CanOnlySpectateOwnTeam = true -- you can only spectate players on your own team

TEAM_CT = 1
TEAM_T = 2

function GM:CreateTeams()

	if ( !GAMEMODE.TeamBased ) then return end

	team.SetUp( TEAM_CT, "Спецназ", Color( 0, 0, 210 ), true )
	team.SetSpawnPoint( TEAM_CT, { "info_player_counterterrorist" } )
	team.SetClass( TEAM_CT, { "ct_urban", "ct_gsg9", "ct_sas", "ct_gign" } )

	team.SetUp( TEAM_T, "Террористы", Color( 210, 0, 0 ), true )
	team.SetSpawnPoint( TEAM_T, { "info_player_terrorist" } )
	team.SetClass( TEAM_T, { "t_terror", "t_leet", "t_arctic", "t_guerilla" } )

	team.SetUp( TEAM_SPECTATOR, "Наблюдатель", Color( 0, 210, 0), true )
	team.SetSpawnPoint( TEAM_SPECTATOR, { "info_player_start", "info_player_terrorist", "info_player_counterterrorist", "info_player_combine", "info_player_rebel" } )

end

--had to hard code to make a silent step :D
function GM:PlayerFootstep(ply, pos, foot, sound, volume, filter )
	if(ply:GetVelocity():Length() < 110) then
		return true
	end
end


