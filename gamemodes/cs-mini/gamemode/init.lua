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
	GAMEMODE:RoundEndWithResult( 1001, "Ничья!" )

end

function GM:CheckRoundEnd()

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
