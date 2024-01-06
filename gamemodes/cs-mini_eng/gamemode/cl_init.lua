include("shared.lua")
include( 'holster.lua' )
include("cl_shop.lua")

if SERVER then
    include("sv_shop.lua")
end

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)

hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()
	return false
end )