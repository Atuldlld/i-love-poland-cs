include("shared.lua")
include( 'holster.lua' )
<<<<<<< HEAD
include("cl_shop.lua")

if SERVER then
    include("sv_shop.lua")
end
=======
include( 'cl_buymenu.lua' )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)

hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()
	return false
end )