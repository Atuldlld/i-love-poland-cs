AddCSLuaFile()

ENT.Base = "base_point"

if SERVER then
	CreateConVar("cs_hostage_enabled", "1", FCVAR_ARCHIVE)
end

local MapWhiteList = {
	["cs_drugbust"] = true,
	["cs_cs16_assault"] = true,
	["cs_east_borough"] = true,
	["cs_italy"] = true,
	["cs_compound"] = true,
	["cs_militia"] = true,
	["cs_assault"] = true,
	["cs_office"] = true,
	["cs_militia"] = false,
	["cs_havana"] = false,
	["cs_jungle"] = false
	}

function ENT:Initialize()
	if MapWhiteList[game.GetMap()] then
		self:SpawnHostage()
	end
end

function ENT:SpawnHostage(dontRemoveExisting)

	if not GetConVar("cs_hostage_enabled"):GetBool() then
		return
	end

	local hostage = ents.Create("cs_hostage")
	hostage:SetPos(self:GetPos())
	hostage:SetAngles(Angle(0, self:GetAngles(). yaw, 0))
	hostage:Spawn()
	if not dontRemoveExisting and IsValid(self.hostage) then
		self.hostage:Remove()
	end
	hostage:SetOriginalPosition(self:GetPos())
	self.hostage = hostage
end

