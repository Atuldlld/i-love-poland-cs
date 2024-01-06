include("shared.lua")
include( 'holster.lua' )
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
include("cl_shop.lua")

if SERVER then
    include("sv_shop.lua")
end
<<<<<<< HEAD
=======
=======
include( 'cl_buymenu.lua' )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)

<<<<<<< HEAD
hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()
	return false
end )
=======
<<<<<<< HEAD
hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()
	return false
end )
=======











>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
