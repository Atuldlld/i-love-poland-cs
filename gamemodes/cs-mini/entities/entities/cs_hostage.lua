AddCSLuaFile()
local SERVER = SERVER
ENT.Base = "base_nextbot"

local hostageModels = {
	"models/characters/hostage_01.mdl",
	"models/characters/hostage_02.mdl",
	"models/characters/hostage_03.mdl",
	"models/characters/hostage_04.mdl",
}

AccessorFunc( ENT, "original_position", "OriginalPosition" )
AccessorFunc( ENT, "follow_target", "FollowTarget")

if SERVER then
	CreateConVar("cs_hostage_escape_cooldown_factor", 0, FCVAR_ARCHIVE, "The factor that sets the cooldown for when a hostage should attempt to escape on his own")
end

if CLIENT then
	ENT.TargetIDHint = {
      name = "Hostage",
	  hint = "",
      fmt  = function(ent, txt) return ent:GetNWString("name", "") end
   };
end

local firstNames = {
	"Christopher",
	"Gabe",
	"Jeffrey",
	"Joe",
	"Ralph",
	"William",
	"Adam",
	"Harry",
	"David",
	"Morgan",
	"Alexander",
	"Jeremy",
	"Chou",
	"Yo",
	"Lee",
	"Robert",
	"Simon"
}
local lastNames = {
	"Pen",
	"Ying",
	"Trung",
	"Styles",
	"Newell",
	"Yu",
	"Johnson",
	"Smith",
	"Bridgeford",
	"Stones",
	"Anderson"
}
function ENT:Initialize()
	self.hostageVars = {}
	self.isHostage = true
	if SERVER then
		self.canPanic = false
		self.loco:SetStepHeight(30)
		self.loco:SetJumpHeight(400)
		self:SetModel(table.Random(hostageModels))
		self:SetUseType(SIMPLE_USE)
		self.cs_last_seen_by_players = CurTime() + 60
		self.escapeCooldownFactor = GetConVar("cs_hostage_escape_cooldown_factor"):GetFloat()
		self.hostageVars["can_attempt_escape"] = false
	end

	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self:SetHealth(60)
	timer.Simple(0, function()
		if IsValid(self) then
			if SERVER then
				self:SetNWString("name", table.Random(firstNames) .. " " .. table.Random(lastNames))

				if not self:GetOriginalPosition() then
					self:SetOriginalPosition(self:GetPos())
				end
				self.hostageVars["rescue_zone"] = table.Random(ents.FindByClass("func_hostage_rescue"))
				if IsValid(self.hostageVars["rescue_zone"]) then
					local tr = util.TraceLine({start = self.hostageVars["rescue_zone"]:OBBCenter(), endpos = self.hostageVars["rescue_zone"]:OBBCenter() - Vector(0,0,500), mask = MASK_NPCWORLDSTATIC})
					if tr.Hit and not tr.HitNoDraw then
						self.hostageVars["rescue_target_pos"] = tr.HitPos
					end
				end
			end
		end
	end)
end

function ENT:Use(ply)
if ply:Team() == 1 then
	if (self.nextUsedTime or 0) < CurTime() then
		self.nextUsedTime = CurTime() + 1
	end

	local followTarget = self:GetFollowTarget()

	if IsValid(followTarget) and followTarget == ply and (self.panicTime or 0) < CurTime() then
		self:SetOriginalPosition(self:GetPos())
		self.hostageVars["crouching"] = followTarget:IsPlayer() and followTarget:Crouching()
		self:SetFollowTarget(nil)
		local sounds = {
			"hostage/hunuse/comeback.wav",
			"hostage/hunuse/dontleaveme.wav",
			"hostage/hunuse/illstayhere.wav",
			"hostage/hunuse/notleaveme.wav",
			"hostage/hunuse/yeahillstay.wav"
		}

		self:EmitSound(table.Random(sounds), 70)
	else
		self:SetFollowTarget(ply)
		self.stop_moving = true
		self.panicTime = 0
		local sounds = {
			"hostage/huse/illfollow.wav",
			"hostage/huse/getouttahere.wav",
			"hostage/huse/letsgo.wav",
			"hostage/huse/letsdoit.wav",
			"hostage/huse/letshurry.wav",
			"hostage/huse/letsmove.wav",
			"hostage/huse/okletsgo.wav",
			"hostage/huse/youlead.wav",
		}

		self:EmitSound(table.Random(sounds), 70)
	end
elseif ply:Team() == 2 then
	ply:ChatPrint("Террористы не могут взаимодействовать с заложниками.")
end
end

function ENT:OnInjured(dmginfo)

	if dmginfo:IsDamageType(DMG_BURN) and not self:IsOnFire() then
		self:Ignite(20)
	end

	local att = dmginfo:GetAttacker()
	self.was_headshot = false
   if (dmginfo:GetDamagePosition() - (self:GetBonePosition(6) + Vector(0,0,3))):Length() < 10 then
	 self:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. math.random(1,4) .. ".wav", 100)
	 self.was_headshot = true

	 dmginfo:SetDamage(dmginfo:GetDamage() * 10)
   elseif dmginfo:IsBulletDamage() then
	 self:EmitSound("physics/flesh/flesh_impact_bullet" .. math.random(1,4) .. ".wav", 70)
   end
   if (self.panicTime or 0) < CurTime() - 25 and self.canPanic then
	self.stop_moving = true
	local curTime = CurTime()
	for k,v in pairs(ents.FindByClass("cs_hostage")) do
		if v:Visible(self) and (v.panicTime or 0) < curTime then
			v.panicTime = curTime  + 30
			v.stop_moving = true
		end
	end
   end
   self.panicTime = CurTime() + 30
end

function ENT:OnKilled(dmginfo)
   local att = dmginfo:GetAttacker()
   self:SetMoney(att)
   att:ChatPrint("Штраф 500$ за убийство заложника.")
   local rag = ents.Create("prop_ragdoll")
   if not IsValid(rag) then return nil end

   rag:SetPos(self:GetPos())
   rag:SetModel(self:GetModel())
   rag:SetAngles(self:GetAngles())
   rag:SetColor(self:GetColor())
   rag:SetMaterial(self:GetMaterial())
   rag:SetSkin(self:GetSkin())

   rag:Spawn()
   rag:Activate()
   if self:IsOnFire() then
	rag:Ignite(math.random(30,60), 50)
	rag:SetMaterial("models/charple/charple1_sheet")
   end

   if dmginfo:IsBulletDamage() and (self.was_headshot and (dmginfo:GetDamage() > 15 or dmginfo:GetDamageForce():Length() > 11) or dmginfo:GetDamagePosition().z > self:GetPos().z + 60) then
	rag:EmitSound("physics/flesh/flesh_bloody_break.wav", 100)
	local ef = EffectData()
	ef:SetOrigin(rag:GetBonePosition(6))
	ef:SetScale(3)
	rag:ManipulateBoneScale(6, Vector(0,0,0))
	util.Effect("BloodImpact", ef)
	timer.Create("ragbloodheadshot", 0.1, 20, function()
		if not IsValid(rag) then return end
		local ef = EffectData()
		ef:SetOrigin(rag:GetBonePosition(6))
		ef:SetScale(3)

		util.Effect("BloodImpact", ef)
	end)
   elseif dmginfo:GetDamage() < 100 then
	rag:EmitSound("hostage/hpain/hpain" .. math.random(1,6) .. ".wav")
   end

   -- nonsolid to players, but can be picked up and shot
   rag:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)

   -- position the bones
   local num = rag:GetPhysicsObjectCount()-1
   local v = self:GetVelocity() + (dmginfo:GetDamageForce() * 0.01)

   for i=0, num do
      local bone = rag:GetPhysicsObjectNum(i)
      if IsValid(bone) then
         local bp, ba = self:GetBonePosition(rag:TranslatePhysBoneToBone(i))
         if bp and ba then
            bone:SetPos(bp)
            bone:SetAngles(ba)
         end

         -- not sure if this will work:
         bone:SetVelocity(v)
      end
   end
   self:Remove()
   timer.Create("cs_hostage_down", 0.5, 1, function()
	BroadcastLua("LocalPlayer():EmitSound('bot/hostage_down.wav')")
   end)
   GAMEMODE.hostagesInRound = GAMEMODE.hostagesInRound - 1
   GAMEMODE.DeadhostagesInRound = GAMEMODE.DeadhostagesInRound + 1
end

local function avoidPlayersCompute(self, area, fromArea, ladder, elevator, length )


	for k,v in pairs(player.GetAll()) do
		if v:Team() != TEAM_SPECTATOR and area:IsVisible(v:GetPos() + Vector(0,0,80)) and not v:Visible(self) then
			return 5
		end
	end

	if ( !IsValid( fromArea ) ) then

		// first area in path, no cost
		return 0

	else
		if ( !self.loco:IsAreaTraversable( area ) ) then
			// our locomotor says we can't move here
			return -1
		end

		if area:HasAttributes(2048) then
			return -1
		end


		// compute distance traveled along path so far
		local dist = 0

		if ( IsValid( ladder ) ) then
			dist = ladder:GetLength()
		elseif ( length > 0 ) then
			// optimization to avoid recomputing length
			dist = length
		else
			dist = ( area:GetCenter() - fromArea:GetCenter() ):GetLength()
		end

		local cost = dist + fromArea:GetCostSoFar()

		// check height change
		local deltaZ = fromArea:ComputeAdjacentConnectionHeightChange( area )
		if ( deltaZ >= self.loco:GetStepHeight() ) then
			if ( deltaZ >= self.loco:GetMaxJumpHeight() ) then
				// too high to reach
				return -1
			end

			// jumping is slower than flat ground
			local jumpPenalty = 5
			cost = cost + jumpPenalty * dist
		elseif ( deltaZ < -self.loco:GetDeathDropHeight() ) then
			// too far to drop
			return -1
		end

		return cost
	end
end

function ENT:RunBehaviour()

	while ( true ) do							-- Here is the loop, it will run forever
		local followTarget = self:GetFollowTarget()
		if (self.panicTime or 0) > CurTime() then
			if math.random(1,2) == 2 then
				self:EmitSound("vo/npc/male01/runforyourlife0" .. math.random(1,3) .. ".wav", 70)
			end
			self.stop_moving = nil
			local spot = self:FindSpot("far", { type = "hiding", pos = self:GetPos(), radius = 6000 })
			if spot then
				self:StartActivity( ACT_RUN_CROUCH )
				self.loco:SetDesiredSpeed( 200 )
				self:MoveToPos(spot, { tolerance = 150, maxage = 10 })
			end
			self:StartActivity(ACT_COVER_LOW)
			coroutine.wait(math.Rand(0.3, 3))
		elseif IsValid(followTarget) then
			local isPly = followTarget:IsPlayer()
			local crouch = isPly and followTarget:Crouching()
			if self:GetPos():Distance(followTarget:GetPos()) > 100 then
				if crouch then
					self:StartActivity( ACT_WALK_CROUCH )
					self.loco:SetDesiredSpeed( 60 )
				else

					if isPly and followTarget:KeyDown(IN_WALK) then
						self:StartActivity( ACT_WALK_CROUCH )
						self.loco:SetDesiredSpeed( 100 )
					elseif self:IsPlayersNearby() then
						self:StartActivity( ACT_RUN_CROUCH )
						self.loco:SetDesiredSpeed( 230 )
					else
						self:StartActivity( ACT_RUN )
						self.loco:SetDesiredSpeed( 280 )
					end
				end
				self:MoveToEnt(self:GetFollowTarget(), 90, { maxage = 5, tolerance = 100 })
			end
			if IsValid(self:GetFollowTarget()) then
				self.loco:FaceTowards(self:GetFollowTarget():GetPos())
			end
			local idleAct = crouch and ACT_COVER_LOW or ACT_IDLE
			if self:GetActivity() != idleAct then
				self:StartActivity( idleAct )
			end
		elseif self.cs_can_be_seen_by_players or ((self.cs_last_seen_by_players or 0) > CurTime()) then

			local targetPos = self:GetOriginalPosition()
			self.stop_moving = nil
			self.hostageVars["trying_to_escape"] = false
			if (targetPos - self:GetPos()):Length() > 100 then
				self:StartActivity( ACT_WALK )
				self.loco:SetDesiredSpeed( 80 )
				self:MoveToPos(targetPos + Vector(math.random(-50,50), math.random(-50,50), 0), { tolerance = 100, repath = 3 })
				self.cs_last_seen_by_players = CurTime() + (math.random(15,30) * self.escapeCooldownFactor)
			end
			local idleAct = self.hostageVars["crouching"] and ACT_COVER_LOW or ACT_IDLE
			if self:GetActivity() != idleAct then
				self:StartActivity( idleAct )
			end
			coroutine.wait( 0.3 )
		elseif self.hostageVars["can_attempt_escape"] then
			self.hostageVars["trying_to_escape"] = true

			if self:IsPlayersNearby() then
				self:StartActivity( ACT_WALK_CROUCH )
				self.loco:SetDesiredSpeed( 90 )
			else
				self:StartActivity( ACT_RUN )
				self.loco:SetDesiredSpeed( 280 )
			end

			if self.hostageVars["rescue_target_pos"] then
				self:MoveToPos(self.hostageVars["rescue_target_pos"] + Vector(math.random(-50,50), math.random(-50,50), 0), { tolerance = 100, maxage = 35, repath = 3}, function(area, fromArea, ladder, elevator, length )
					return avoidPlayersCompute(self, area, fromArea, ladder, elevator, length )
				end)
			else
				local targetPos = self:GetPos() + Vector( math.Rand( -1, 1 ), math.Rand( -1, 1 ), 0 ) * 200
				local tr = util.TraceEntity({start = targetPos + Vector(0,0,20), endpos = targetPos + Vector(0,0,30)}, self)

				if not tr.Hit then
						self:MoveToPos( targetPos )
				end
			end
			local idleAct = self.hostageVars["crouching"] and ACT_COVER_LOW or ACT_IDLE
			if self:GetActivity() != idleAct then
				self:StartActivity( idleAct )
			end
			coroutine.wait( 0.3 )
		else
			if idleAct and  (self:GetActivity() != idleAct) then
				self:StartActivity( idleAct )
			end
			coroutine.wait( 0.3 )
		end
		coroutine.yield()
		-- The function is done here, but will start back at the top of the loop and make the bot walk somewhere else
	end

end

function ENT:OnContact(ent)
	if IsValid(ent) then
		if ent:IsPlayer() then
			local f = (ent:GetPos() - self:GetPos()):Angle():Forward()
			ent:SetVelocity(f * 200)
		elseif IsValid(ent:GetPhysicsObject()) then
			local f = (ent:GetPos() - self:GetPos()):Angle():Forward()
			ent:GetPhysicsObject():SetVelocity(f * 200)
		end
	end
end

function ENT:IsPlayersNearby()

	local pos = self:GetPos()
	local followTarget = self:GetFollowTarget()
	for k,v in pairs(player.GetAll()) do
		if v != followTarget and v:Team() != TEAM_SPECTATOR and v:Alive() and (v:GetPos() - pos):Length() < 2000 then
			return true
		end
	end

	return false
end

ENT.nextThinkTime = 0
ENT.nextUseTime = 0
function ENT:Think()
	self.BaseClass:Think()

	if CLIENT then
		self:SetEyeTarget(LocalPlayer():GetShootPos() + Vector(0,0,5))
	end

	local curTime = CurTime()
	if self.nextThinkTime < curTime then

		if SERVER then
			self.cs_can_be_seen_by_players = self:CanBeSeenByPlayers()
			if self.cs_can_be_seen_by_players then

				self.cs_last_seen_by_players = CurTime() + (math.random(15, 30) * self.escapeCooldownFactor)
			end

			if self.cs_can_be_seen_by_players and self.hostageVars["trying_to_escape"] then
				self.stop_moving = true
				self.hostageVars["trying_to_escape"] = false
			end

			self.nextThinkTime = curTime + 0.3
		else

		end
	end
	if SERVER and self.nextUseTime < curTime then
		local followTarget = self:GetFollowTarget()
		if IsValid(followTarget) and ((followTarget:IsPlayer() and (not followTarget:Alive() or followTarget:Team() == TEAM_SPECTATOR)) or not self:Visible(followTarget)) then

			self.hostageVars["following_not_visible_i"] = (self.hostageVars["following_not_visible_i"] or 0) + 1
			if self.hostageVars["following_not_visible_i"] >= 20 then
				self:SetFollowTarget(nil)
				self.hostageVars["following_not_visible_i"] = 0
				self.stop_moving = true
			end
		else
			self.hostageVars["following_not_visible_i"] = 0
		end
		self.nextUseTime = curTime + 0.3
		local ent = self:FindUseEntity()
		if IsValid(ent) then
			self.nextUseTime = curTime + 2
			if ent:GetClass() == "func_breakable_surf" then
				ent:Fire("shatter")
			elseif ent:GetClass() == "func_breakable" then
				ent:Fire("break")
			elseif ent:GetClass() == "prop_door_rotating" then
				ent:Fire("open")
			else
				ent:Use(self, self, SIMPLE_USE, 1)
			end
		end
	end
end

local function isUsableEntity(ent)
	if (ent.Use or ent.OnUse) and not ent.isHostage then
		return true
	end

	return false
end

function ENT:FindUseEntity()

	local useableContents = bit.bor(MASK_SOLID, CONTENTS_DEBRIS, CONTENTS_PLAYERCLIP)
	local numTangents = 8
	local tr = nil
	local pObject = nil
	local searchCenter = self:GetPos() + Vector(0,0,50)
	local forward = self:GetForward()
	local up = self:GetUp()
	// trace a box at successive angles down
	//							forward, 45 deg, 30 deg, 20 deg, 15 deg, 10 deg, -10, -15
	local tangents ={ 0, 1, 0.57735026919, 0.3639702342, 0.267949192431, 0.1763269807, -0.1763269807, -0.267949192431 };
	for i = 0, numTangents do
		if ( i == 0 ) then
			tr = util.TraceLine( { start = searchCenter, endpos = searchCenter + forward * 1024, mask = useableContents, filter = { self }, collisiongroup = COLLISION_GROUP_NONE } );
		else
			local down = forward - tangents[i]*up;
			down = down:Angle():Forward()
			tr = util.TraceHull( { start = searchCenter, endpos = searchCenter + down * 72, mins = -Vector(16,16,16), maxs = Vector(16,16,16), mask = useableContents, filter = { self }, collisiongroup = COLLISION_GROUP_NONE });
		end
		pObject = tr.Entity
		local bUsable = isUsableEntity(pObject)
		if not bUsable and IsValid(pObject:GetMoveParent()) then
			pObject = pObject:GetMoveParent()
			bUsable = isUsableEntity(pObject)
		end

		if bUsable then
			return pObject
		end
	end
end

function ENT:MoveToEnt( ent, dist, options )

	local options = options or {}

	local path = Path( "Follow" )	-- Define the path for the bot to follow
	path:SetMinLookAheadDistance( options.lookahead or 300)
	path:SetGoalTolerance( options.tolerance or 40 )
	path:Compute( self, ent:GetPos() )		-- Calculate the path for the bot

	while ( ent:IsValid() and ent:GetPos():Distance(self:GetPos()) > dist ) do

		path:Compute( self, ent:GetPos() )		-- Calculate the path for the bot

		 		-- "Move the bot along the path"
		local nextpos = path:GetPositionOnPath(path:GetCursorPosition() + 300)
		if math.abs(nextpos.z - self:GetPos().z) > 50 then
			self:SetPos(nextpos)
			path:MoveCursorTo(path:GetCursorPosition() + 300)
		else
			path:Update( self )
		end
		if ( options.draw ) then path:Draw() end

		-- If we're stuck then call the HandleStuck function and abandon
		if ( self.loco:IsStuck() ) then
			self:HandleStuck();
			return "stuck"
		end
		coroutine.yield()
	end

	return "ok"

end

function ENT:MoveToPos( pos, options, compute)

	local options = options or {}
	options.repath = options.repath or 1

	local path = Path( "Follow" )
	path:SetMinLookAheadDistance( options.lookahead or 300 )
	path:SetGoalTolerance( options.tolerance or 20 )
	path:Compute( self, pos, compute )
	self.loco:Approach(pos, 1)

	if ( !path:IsValid() ) then return "failed" end

	while ( path:IsValid() ) do

		path:Update( self )

		-- Draw the path (only visible on listen servers or single player)
		if ( options.draw ) then
			path:Draw()
		end

		-- If we're stuck then call the HandleStuck function and abandon
		if ( self.loco:IsStuck() ) then

			self:HandleStuck();

			return "stuck"

		end

		--
		-- If they set maxage on options then make sure the path is younger than it
		--
		if ( options.maxage ) then
			if ( path:GetAge() > options.maxage ) then return "timeout" end
		end

	    if self.stop_moving then
			self.stop_moving = nil
			return "timeout"
		end
		--
		-- If they set repath then rebuild the path every x seconds
		--
		if ( options.repath ) then
			if ( path:GetAge() > options.repath ) then path:Compute( self, pos, compute ) end
		end

		coroutine.yield()

	end

	return "ok"

end

function ENT:CanBeSeenByPlayers()
	local pos = self:GetPos()
	for k,v in pairs(player.GetAll()) do
		if v:Team() != TEAM_SPECTATOR and v:Alive() and v:Visible(self) and (v:WorldToLocal(pos).x > 3) and (v:GetPos() - pos):Length() < 600  then
			return true
		end
	end

	return false
end

function ENT:BodyUpdate()

	local act = self:GetActivity()

	--
	-- This helper function does a lot of useful stuff for us.
	-- It sets the bot's move_x move_y pose parameters, sets their animation speed relative to the ground speed, and calls FrameAdvance.
	--
	--
	if ( act == ACT_WALK ) then

		self:BodyMoveXY()

	end

	--
	-- If we're not walking or running we probably just want to update the anim system
	--
	self:FrameAdvance()

end