AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "holster.lua" )
AddCSLuaFile( "cl_shop.lua" )
AddCSLuaFile( "deathsounds.lua" )

include( 'shared.lua' )
include("cl_shop.lua")
include("deathsounds.lua")



-- Serverside only stuff goes here

--Makes a pre round, also doesnt draw the game every time im testing it
function GM:StartRoundBasedGame()

	GAMEMODE:PreRoundStart( 1 )

--	StripWorld()

end

--tells the game what to do every
function GM:OnRoundStart( num )

	for t=1,2 do
		for k,v in pairs( team.GetPlayers( t ) ) do
		--	v:SetFrags( 0 )
		--	v:SetDeaths( 0 )
		end
	end

	UTIL_UnFreezeAllPlayers()

	GAMEMODE.hostagesInRound = #ents.FindByClass("cs_hostage")
	GAMEMODE.TotalhostagesInRound = GAMEMODE.hostagesInRound
	GAMEMODE.DeadhostagesInRound = 0
	GAMEMODE.hostagesInRoundM = GAMEMODE.hostagesInRound
	if GAMEMODE.hostagesInRound > 0 then
		IsCSRound = true
	else
		IsCSRound = false
	end

end


function GM:OnRoundResult( t )

	if t == 1 then
		BroadcastLua([[sound.Play("radio/ctwin.wav",LocalPlayer():GetPos())]]) -- COUNTER TERRORISTS WIN
	elseif t == 2 then
		BroadcastLua([[sound.Play("radio/terwin.wav",LocalPlayer():GetPos())]]) -- TERRORISTS WIN
	else
		BroadcastLua([[sound.Play("radio/rounddraw.wav",LocalPlayer():GetPos())]]) --ROUND DRAW
	end

	team.AddScore( t, 1 )

	-- if team.GetScore( t ) >= 3 then
	-- 	timer.Simple( 5, function() GAMEMODE:EndOfGame( false ) end )
	-- end

end

function GM:RoundTimerEnd()

	-- if team.TotalFrags( TEAM_CT ) < team.TotalFrags( TEAM_T ) then
	-- --	GAMEMODE:RoundEndWithResult( TEAM_T )
	-- 	GAMEMODE:RoundEndWithResult( 1001, "Draw, everyone loses!" )
	-- elseif team.TotalFrags( TEAM_CT ) > team.TotalFrags( TEAM_CT ) then
	-- --	GAMEMODE:RoundEndWithResult( TEAM_CT )
	-- 	GAMEMODE:RoundEndWithResult( 1001, "Draw, everyone loses!" )
	-- else
	-- 	GAMEMODE:RoundEndWithResult( 1001, "Draw, everyone loses!" )
	-- end
	GAMEMODE:RoundEndWithResult( 1001, "Draw, everyone loses!" )

end

function GM:CheckRoundEnd()
	if IsCSRound then
		if !(GAMEMODE.DeadhostagesInRound == GAMEMODE.TotalhostagesInRound) and GAMEMODE.hostagesInRound <= 0 then
			GAMEMODE:RoundEndWithResult(TEAM_CT)
		end
	end
end

function GM:OnRoundWinner( )

end

function StripWorld()
    -- Remove all weapons from the world.
	for k,v in pairs(ents.FindByClass("weapon_*")) do
        v:Remove()
    end
	-- Remove all items from the world.
	for k,v in pairs(ents.FindByClass("item_*")) do
        v:Remove()
    end
end

--------------------------------------------------------------------------------------------------------------
hook.Add("InitPostEntity", "csHostages_InitMap", function()
	timer.Simple(3, function()
		if not navmesh.IsLoaded() and GetConVar("cs_hostage_enabled"):GetBool() then
			if #ents.FindByClass("hostage_entity") > 0 then
				local entities = ents.FindByClass("hostage_entity")
				entities = table.Add(entities, ents.FindByClass("info_player*"))
				for k,v in pairs(entities) do
					navmesh.AddWalkableSeed(v:GetPos(), v:GetUp())
				end

				print("Navmesh is not generated for map - Generating now..")
				navmesh.BeginGeneration()

			end
		end
	end)
end)