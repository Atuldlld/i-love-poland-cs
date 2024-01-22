AddCSLuaFile()

ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()

end

function ENT:StartTouch(ent)
	if ent:GetClass() == "cs_hostage" then

		local followTarget = ent:GetFollowTarget()
		GAMEMODE.hostagesInRound = (GAMEMODE.hostagesInRound or 0) - 1
		if !hook.Call("csHostageRescued", ent, followTarget) then
			ent:Remove()
		end
		local recipientFilter = RecipientFilter()
		for k,v in pairs(player.GetAll()) do
			if (v:Team() == 1) or (v:Team() == TEAM_SPECTATOR) then
				recipientFilter:AddPlayer(v)
			end
		end

		umsg.Start("cs_hostage_rescued", recipientFilter)
		umsg.End()
	end
end

-- if CLIENT then
-- 	local nextRescueTime = 0


-- 		if nextRescueTime >= CurTime() then return end
-- 		nextRescueTime = CurTime() + 3
-- 		-- surface.PlaySound('radio/rescued.wav')
-- end