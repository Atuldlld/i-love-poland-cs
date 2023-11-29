AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sv_buymenu.lua" )
AddCSLuaFile( "hidenames.lua" )
AddCSLuaFile( "holster.lua" )
AddCSLuaFile( "cl_buymenu.lua" )

include( 'shared.lua' )
include( 'sv_buymenu.lua' )
include( 'hidenames.lua' )
include( 'cl_buymenu.lua' )

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

hook.Add( "GetFallDamage", "NoRunnerDamage", function( ply, speed )
    if ply.Runner then
        return 0
    end
end )

hook.Add( "PlayerDeath", "NoRunnerDamage", function( victim, inflictor, attacker )
 victim.Runner = false
end )

