include("shared.lua")
include( 'holster.lua' )
include( 'cl_buymenu.lua' )

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)












