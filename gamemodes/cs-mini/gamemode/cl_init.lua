include("shared.lua")
include( 'holster.lua' )

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)












