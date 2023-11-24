if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end
----------------------------------------------------------/
--/														--/
--/				Project Start: 11/11/13					--/
--/														--/
----------------------------------------------------------/
-----------------------------------------------------------
--	Client Variables
-----------------------------------------------------------
if ( CLIENT ) then

	SWEP.PrintName			= "SWEPNAME"
	SWEP.Author				= "Fonix"
	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "" --Text Font
	SWEP.IconLetterCSS		= "" --For Css Font
	SWEP.DrawCrosshair		= true
	SWEP.DrawAmmo			= true
	SWEP.CSMuzzleFlashes	= true

	killicon.AddFont( "weapon_cs_ak47_gb", "TextKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	surface.CreateFont("TextKillIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(13),antialiasing=true,additive=true })
	surface.CreateFont("TextSelectIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(20),antialiasing=true,additive=true })
	surface.CreateFont("CSKillIcons", { font="csd", weight="500", size=ScreenScale(30),antialiasing=true,additive=true })
	surface.CreateFont("CSSelectIcons", { font="csd", weight="500", size=ScreenScale(60),antialiasing=true,additive=true })

end
-----------------------------------------------------------
--	The Layout...
---------------------------------------------------------
SWEP.Category			= "Hello"
SWEP.ViewModelFlip		= true

SWEP.Spawnable			= false 	-- Delete this comment and change these to true
SWEP.AdminSpawnable		= false		-- If you don't you can't spawn the swep :(

SWEP.ViewModel			= "models/weapons/v_rif_ak47.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_ak47.mdl"
SWEP.ViewModelFOV		= 55

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= true
SWEP.BounceWeaponIcon	= false

SWEP.Primary.Sound			= Sound( "" )
SWEP.SilencedSound			= Sound( "" ) --This is for silencers. Dont bite me, I know its really called a suppressor.
SWEP.PackAPunchSound		= Sound( "pap.Single" )
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 34
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

--Extras
SWEP.MuzzleEffect			= "lee_muzzle_rifle"	-- Muzzle attachments should not be messed with
SWEP.MuzzleAttachment		= "1"			-- There's only one anyways
SWEP.MuzzleAttachmentTrue	= true		-- Keep it true
SWEP.TracerShot				= 3		-- On what shot should there be a tracer?
SWEP.TakeAmmoOnShot			= 1     -- How many rounds should we take per shot? Typically leave this at one.
SWEP.BulletForce			= 10	-- The force a bullet has on a prop
SWEP.Silenceable			= false		-- If the model supports a silencer
SWEP.SilenceHolster			= 0		-- The timing for silencer animation
SWEP.ZoomFOV				= 65	-- Fov for when we're aiming
SWEP.CSSZoom				= false	-- This is for using Zoom Delays. Example the AUG zoom in CSS
SWEP.MPrecoil				= 1		-- Changes the amount of view punch in multiplayer
SWEP.ReloadHolster			= 1		-- How long should we wait before allowing think when reloading(Seconds or Gmodical Units. Idk)
SWEP.ReloadSound			= false	-- This has only been found to be used on HL2 weapons
SWEP.StockIronSightAnim		= false -- This is used for multiplayer, check out the ak. Do we want to use the animation or the scripted animation?
SWEP.BoltAction				= false
SWEP.ViewModelCSS			= true -- Donot use this.. unless you understand what it does, look done in the code if you give a shet..

--FireModes
SWEP.FiringMode			= false --Can we switch the firing modes? Auto, Semi, and Burst?
SWEP.Burstable 			= false --Can we burst with firing modes?
SWEP.BurstShots 		= 0 	--How many rounds should we shoot on burst? If you use more than 5 you are retarded beyond hell.
SWEP.PistolBurstOnly	= false --This might be confusing like the rest of my base. Only use this for pistols that only "burst" and "Semi" fire.


-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.015 -- Accuracy when we're standing still
SWEP.IronSightsCone			= 0.006 -- Accuracy when we're aiming
SWEP.Delay				= 0.08	-- Delay For Not Zoom
SWEP.Recoil				= 1	-- Recoil For not Aimed
SWEP.RecoilZoom				= 0.4	-- Recoil For Zoom

-----------------------------------------------------------
-----------------------------------------------------------
function SWEP:Initialize()

	if ( SERVER ) then
		self:SetNPCMinBurst( 30 )
		self:SetNPCMaxBurst( 30 )
		self:SetNPCFireRate( 0.01 )
	end

	self.Weapon:SetNetworkedBool( "Ironsights", false )
	self.Weapon:SetNetworkedBool("Burst",false)
	self.Weapon:SetNetworkedBool("pap",false)
	self.Weapon:SetNetworkedBool("HitRecoil", true)
	self.Weapon:SetNetworkedBool("dt", false)
	self.Weapon:SetNWBool("Reloading", false)
	self.OGVMFLIP = self.ViewModelFlip
	self.OGViewModelFOV = self.ViewModelFOV
	self.oldVModel = self.ViewModel
	self.VMLoc = self.IronSightsPos or Vector(0,0,0)
	self.RecoilMax = 0.5
	self.RecoilReturn = 0.5
	self.IronAjust = 0
	self.IronAjustMin = 0

	if (self.Owner:GetNWBool("HasDeadEye") == true) then
		self:DeadEye()
	end
	if (self.Owner:GetNWBool("HasPap") == true) then
		self:PackAPunch()
	end

	self.Reloadaftershoot = 0
	self.nextreload = 0

	self:SetNWFloat("SprayAdditive",0)
	self:SetNWInt("LastClip",0)
	self:SetNWInt("firemode", 1)

	self:SetHoldType(self.HoldType)
end
-----------------------------------------------------------
--Think
---------------------------------------------------------

function SWEP:Equip( NewOwner )
	self:SetHoldType(self.HoldType)
end

function SWEP:Think()



		--When the convar says so, flip it.

		self:SpreadSystem()
		--A Spread System that Changes the SPREAD

	--	self:DashingPos()
		--Dont to be confused with doshing

		self:LuaAnimation()
		--MoveModelWhenFiring

	end

SWEP.SetNextFireMode		= 0
SWEP.Cycle					= 0

local oldVMFOV = SWEP.ViewModelFOV

SWEP.ViewModel2 = "models/weapons/v_rif_ak47.mdl"

-----------------------------------------------------------
--VM FLIP
---------------------------------------------------------

function SWEP:LuaAnimation()

	if  self.SetNextFireMode2 >= CurTime() then
			if self.IronAjust == self.IronAjustMin then
				self.IronAjust = self.IronAjust + self.RecoilReturn
			end
	end
	if  self.SetNextFireMode2 < CurTime() then
		if self.IronAjust >= self.RecoilMax then
				self.IronAjust = self.IronAjust - self.RecoilReturn
			end
	end

	local OriginalOrigin = self.IronSightsPos
	self.VMLoc	= OriginalOrigin - Vector(0	,self.IronAjust,0)

end

-----------------------------------------------------------
--DashingPos
---------------------------------------------------------
function SWEP:DashingPos()

	if (self.Owner:GetRunSpeed() < 150) then return end

	if self.Owner:KeyPressed(IN_USE) then return end

		if self.Owner:KeyDown(IN_SPEED) then
				self.IronSightsPos	= self.DashArmPos
				self.IronSightsAng	= self.DashArmAng
				self.Weapon:SetNetworkedBool("Ironsights", true)
				self.SwayScale 	= 1.0
				self.BobScale 	= 2.2
		elseif self.Owner:KeyReleased(IN_SPEED) then
				self.Weapon:SetNextPrimaryFire( CurTime() + 0.3 )
				self.Weapon:SetNetworkedBool("Ironsights", false)
		end

		if self.Owner:KeyDown(IN_SPEED) then return end

end

-----------------------------------------------------------
--SpreadSystem
---------------------------------------------------------
function SWEP:SpreadSystem()


	if (self.Weapon:GetNetworkedBool("DeadEye") == false) or (self.Weapon:GetNetworkedBool("DeadEye") == nil) then

		if self.Owner:OnGround() and (self.Owner:KeyDown(IN_FORWARD) or self.Owner:KeyDown(IN_BACK) or self.Owner:KeyDown(IN_MOVERIGHT) or self.Owner:KeyDown(IN_MOVELEFT)) then
			if self.Owner:KeyDown(IN_DUCK) then
				self.Primary.Cone = self.CrouchWalkCone
			elseif self.Owner:KeyDown(IN_SPEED) then
			self.Primary.Cone = self.AirCone
			else
				self.Primary.Cone = self.WalkCone
			end
		elseif self.Owner:OnGround() and self.Owner:KeyDown(IN_DUCK) then
			self.Primary.Cone = self.CrouchCone
		elseif not self.Owner:OnGround() then
			self.Primary.Cone = self.AirCone
		else
				self.Primary.Cone = self.StandCone
		end

		if self.Weapon:GetNetworkedBool( "Ironsights") and self.Owner:OnGround() then
				self.Primary.Cone  = self.IronSightsCone
		end
	else
		self.Primary.Cone = 0.003
	end


		if self.Owner:KeyPressed(IN_ATTACK) then
			self:SetNWInt("LastClip", self.Weapon:Clip1())
		end
		if self.Owner:KeyReleased(IN_ATTACK) then
			self:SetNWFloat("SprayAdditive", 0)
		end

	if self.Owner:KeyPressed(IN_SPEED) then
		self.Owner:SetFOV(0, 0.15)
	end

	if (game.SinglePlayer() ) then
		self:SetNWInt("sprecoil", 1.8)
		self:SetNWInt("mprecoil", 1)
	else
		self:SetNWInt("MPrecoil", 10)
		self:SetNWInt("sprecoil", 5)
	end
end
-----------------------------------------------------------
--Deploy
---------------------------------------------------------
function SWEP:Deploy()

	self.Weapon:SetNWBool("Reloading", false)

	if self.Weapon:GetNetworkedBool("Silenced") == true then
			self.Weapon:SendWeaponAnim( ACT_VM_DRAW_SILENCED );
		else
			self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
		end
	--Which draw should we use? The bool knows all.

	self:SetWeaponHoldType( self.HoldType )
	--Restores the Weapon hold type

	self.Reloadaftershoot = CurTime() + 1
	--Can't shoot while deploying

	self:SetIronsights(false)
	--Set the ironsight mode to false

	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	--Set the next primary fire to 1 second after deploying

	self.Primary.Delay = self.Delay
	--Set Delay back to normal

	self.Primary.Recoil = self.Recoil
	--Set Recoil to normal

	if self.PistolBurstOnly then
		self.Cycle = 2
	end

	if timer.Exists("ReloadTimer") then
		timer.Destroy("ReloadTimer")
	end
	--Destroy the faggot timer on deploy if its running.

	self:SetNWInt("skipthink", false)

	return true
end

SWEP.DoubleTapped = false
---------------------------------------------------------
--Perk: DoubleTap
---------------------------------------------------------
function SWEP:DoubleTap()

	if (self.Weapon:GetNetworkedBool("dt", false)) then
		if (self.Delay >= 0.06 and self.Delay <= 0.09) then
				self.Delay = 0.06
		end
		if (self.Delay >= 0.09 and self.Delay <= 0.13) then
				self.Delay = 0.06
		end
		if (self.Delay > 0.13 and self.Delay <= 0.2) then
				self.Delay = self.Delay - 0.024
		end
		if (self.Delay > 0.2) then
				self.Delay = self.Delay - 0.03
		end
	self.Primary.Delay = self.Delay
	self.Weapon:SetNetworkedBool("dt", true)
	self.DoubleTapped = true;
	end
end

function SWEP:GetDoubleTap()
	local dt = self.DoubleTapped
	return dt
end

SWEP.PackPunched = false
----------------------------------------------------------
--Perk: Packed a Punch
---------------------------------------------------------
function SWEP:PackAPunch()

	if (self.PackPunched == false) then
			self.PackPunched = true;
			self.Weapon:SetNetworkedBool("pap", true)
			self.Primary.ClipSize = self.Primary.ClipSize + math.ceil(self.Primary.ClipSize * 0.333333)
			self:TakePrimaryAmmo( 1 )
			time.Simple(0.05, function()
			self:Reload();
			end)
			if (self.BoltAction) then
				self.Delay = self.Delay * 0.5
				self.Primary.Delay = self.Delay
			end
	end
end

function SWEP:GetPackAPunch()
	local dt = self.PackPunched
	return dt
end

SWEP.DeadEyed = false
SWEP.DeadEyeMul	= 1
-----------------------------------------------------------
--Perk: DeadEye
---------------------------------------------------------
function SWEP:DeadEye()

	if (self.DeadEyed == false) then
			self.DeadEyed = true;
			self.Weapon:SetNetworkedBool("DeadEye", true)
			self.DeadEyeMul = 0.5
	end
end

function SWEP:GetDeadEye()
	local dt = self.DeadEyed
	return dt
end

SWEP.MuleKicked = false
-----------------------------------------------------------
--Perk: DeadEye
---------------------------------------------------------
function SWEP:MuleKick()

	if (self.MuleKicked == false) then
			self.MuleKicked = true;
			self.Recoil = self.Recoil * 0.5
	end
end

function SWEP:GetMuleKick()
	local dt = self.MuleKicked
	return dt
end


-----------------------------------------------------------
--Reload
---------------------------------------------------------
function SWEP:Reload()

		if self.Owner:KeyDown(IN_ATTACK) then return end

		if( self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 || self.Weapon:Clip1() >= self.Primary.ClipSize)	then return end
		--Why go through the function is dis nigga got no reserve, aswell a full clip?


		if ( self.Reloadaftershoot > CurTime() ) then return end
		--If you're firing, you can't reload

		if self.Weapon:GetNetworkedBool("Silenced") == true then
			self.Weapon:DefaultReload( ACT_VM_RELOAD_SILENCED );
		else
			self.Weapon:DefaultReload(ACT_VM_RELOAD)
		end

		self:SetIronsights( false )
		self.Weapon:SetNetworkedBool("Ironsights", false)
		--Set the ironsight to false

		self.Owner:SetFOV( 0, 0.15 )
		--Set the Fov back to normal if zoomed

		self:SetWeaponHoldType( self.HoldType )
		--Make sure that holdtypes dont get mixed and masshshed and stuff

		if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then

		self.MouseSensitivity = 1
		--Set MouseSens Back to one

		self.Primary.Delay = self.Delay
		--Set Delay back to normal

		self.Primary.Recoil = self.Recoil
		--Set Recoil to normal

		if not CLIENT then
			self.Owner:DrawViewModel(true)
		end

		if (self.ReloadSound) then
		self.Weapon:EmitSound(self.Primary.Reload)
		end
	end
end

SWEP.SetNextFireMode2 = CurTime()

-----------------------------------------------------------
--	PrimaryAttack
---------------------------------------------------------
function SWEP:PrimaryAttack()

	if self.SetNextFireMode > CurTime() then return end


	if(!self.Owner:IsNPC())	then
	if self.Owner:KeyDown(IN_SPEED) and (self.Owner:GetRunSpeed() > 600) then return end -- срельба при беге
	end
	--Skip firing when sprinting and dashing is allowed

	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

	if (self.Weapon:GetNetworkedBool("DeadEye") == false) or (self.Weapon:GetNetworkedBool("DeadEye") == nil) then
		if ( self.Weapon:Clip1() < self:GetNWInt("LastClip") - 4) and (self:GetNWFloat("SprayAdditive") != 15) then
			self:SetNWFloat("SprayAdditive",self:GetNWFloat("SprayAdditive") + 0.5 )
		end
	end

	self.SetNextFireMode2 =  CurTime() + (self.Primary.Delay * 0.5)

	if ( !self:CanPrimaryAttack() ) then return end


	local Hacking = false

	if GetConVar("cl_ptp_damage_disable") == nil then
		Hacking = false
	else
		Hacking = GetConVar("cl_ptp_damage_disable"):GetBool()
	end

	local dmgMul = 1

	if Hacking then
	dmgMul = 0.001
	else
	dmgMul = 1
	end


	if self.Weapon:GetNetworkedBool("Silenced") == true and self.Weapon:GetNetworkedBool("pap") == false then
		self.Weapon:EmitSound( self.SilencedSound )
		self:CSShootBullet( self.Primary.Damage * 0.8 * dmgMul, self.Recoil * 0.75, self.Primary.NumShots, self.Primary.Cone, self.MuzzleEffect )
	end
	if self.Weapon:GetNetworkedBool("pap") == true then
		if self.Weapon:GetNetworkedBool("Silenced") == true then
			self.Weapon:EmitSound( self.SilencedSound )
		else
			self.Weapon:EmitSound( self.Primary.Sound )
		end
		self.Weapon:EmitSound( self.PackAPunchSound )
		self:CSShootBullet( self.Primary.Damage * 2 * dmgMul, self.Recoil * 0.4, self.Primary.NumShots, self.Primary.Cone, "lee_muzzle_rifle_pap" )
	end
	if ((self.Weapon:GetNetworkedBool("pap") ==  false) and (self.Weapon:GetNetworkedBool("Silenced") == false)) then
		self.Weapon:EmitSound( self.Primary.Sound )
		self:CSShootBullet( self.Primary.Damage * dmgMul , self.Recoil , self.Primary.NumShots, self.Primary.Cone, self.MuzzleEffect )
	end
	--If Swep Data is Silenced Play Silenced else Unsilenced

	self:TakePrimaryAmmo( self.TakeAmmoOnShot )
	--Remove X bullet from our clip

	if self.Weapon:GetNetworkedBool("Burst", true) then
		self.BurstTimer = CurTime()
		self.SetNextPrimaryFire = CurTime() + 0.5
		self.BurstCounter = self.BurstShots - 1
	end

	if ( self.Owner:IsNPC() ) then return end

	-- Punch the player's view
	self.Owner:ViewPunch( Angle( math.Rand(-0.2,-0.2) * 0.5, math.Rand(-0.1,0.1) * 0.5, 0 ) )

	-- In singleplayer this function doesn't get called on the client, so we use a networked float
	-- to send the last shoot time. In multiplayer this is predicted clientside so we don't need to
	-- send the float.
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
	end

end
-----------------------------------------------------------
 --  Name: SWEP:CSShootBullet( )
---------------------------------------------------------
function SWEP:CSShootBullet( dmg, recoil, numbul, cone, flash )

	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01

	local ang = self.Owner:GetAimVector()
		  ang = Vector(ang.x, ang.y, ang.z + (math.abs(self:GetNWFloat("SprayAdditive"))* .001 * 5))


	local bullet = {}
	bullet.Num 		= numbul
	bullet.Src 		= self.Owner:GetShootPos()					-- Source
	bullet.Dir 		= ang										-- Dir of bullet
	bullet.Spread 	= Vector( cone, cone, 0 )					-- Aim Cone
	bullet.Tracer	= self.TracerShot							-- Show a tracer on every x bullets
	bullet.Force	= self.BulletForce/25						-- Amount of force to give to phys objects
	bullet.Damage	= dmg

	if (!Hacking) then
	self.Owner:FireBullets( bullet ) --Sorry asshole
	end

	self.Owner:MuzzleFlash()							-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 ) 					--3rd Person Animation


	if ((self.Weapon:GetNetworkedBool("Ironsights") == true) && (self.StockIronSightAnim == true)) then
		if self.Weapon:GetNetworkedBool("Silenced") == false then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		end
	end
	if (self.Weapon:GetNetworkedBool("Ironsights") == false)then
		if self.Weapon:GetNetworkedBool("Silenced") == false then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		end
	end
	if ((self.Weapon:GetNetworkedBool("Ironsights") == true) && (self.StockIronSightAnim == false)) then
	end

	if ((self.Weapon:GetNetworkedBool("Ironsights") == true) && (self.StockIronSightAnim == false) && (game.SinglePlayer()) ) then
		if self.Weapon:GetNetworkedBool("Silenced") == false then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		end
	end

	if (self.Primary.Ammo == "pistol" and self.Weapon:GetNetworkedBool("pap") == true) then
		if (SERVER) then
			local eyetrace = self.Owner:GetEyeTrace();
			local explo = ents.Create( "env_explosion" )
			explo:SetPos( eyetrace.HitPos )
			explo:SetOwner( self.Owner )
			explo:SetKeyValue( "iMagnitude", "15" )
			explo:SetKeyValue( "iRadiusOverride", 250 )
			explo:Spawn()
			explo:Activate()
			explo:Fire( "Explode", "", 0 )
		end
	end


	local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)

		util.Effect(flash,fx)


	-- CUSTOM RECOIL !
	if(!self.Owner:IsNPC()) then
	if ( (game.SinglePlayer() && SERVER) || ( !game.SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then

		local eyeang = self.Owner:EyeAngles()
		eyeang.pitch = eyeang.pitch - ((recoil/4) * self.DeadEyeMul) --Dont mess with this.
		self.Owner:SetEyeAngles( eyeang )

	end
	end
end

-----------------------------------------------------------
--	Checks the objects before any action is taken
--	This is to make sure that the entities haven't been removed
---------------------------------------------------------
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	draw.SimpleText( self.IconLetter, "TextSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )

	-- try to fool them into thinking they're playing a Tony Hawks game
--	draw.SimpleText( self.IconLetter, "TextSelectIcons", x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-14, 14), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
--	draw.SimpleText( self.IconLetter, "TextSelectIcons", x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-9, 9), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )

	draw.SimpleText( self.IconLetterCSS, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )

	-- try to fool them into thinking they're playing a Tony Hawks game
--	draw.SimpleText( self.IconLetterCSS, "CSSelectIcons", x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-14, 14), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
--	draw.SimpleText( self.IconLetterCSS, "CSSelectIcons", x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-9, 9), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )

end


ptp_viewmodel_bob = 1
ptp_viewmodel_sway = 1.5

local IRONSIGHT_TIME = 0.15
-----------------------------------------------------------
--   Name: GetViewModelPosition
 --  Desc: Allows you to re-position the view model
---------------------------------------------------------
function SWEP:GetViewModelPosition( pos, ang )

	if ( !self.IronSightsPos ) then return pos, ang end

	local bIron = self.Weapon:GetNetworkedBool( "Ironsights" )

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

		if (bIron) then
			self.SwayScale 	= 0.3
			self.BobScale 	= 0.01
		else
			self.SwayScale 	= ptp_viewmodel_bob
			self.BobScale 	= ptp_viewmodel_sway
		end

	end

	local fIronTime = self.fIronTime or 0

	if (!bIron && fIronTime < CurTime() - IRONSIGHT_TIME) then
		return pos, ang
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if (!bIron) then Mul = 1 - Mul end
	end


	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 	self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 	self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	pos = pos + self.VMLoc.x * Right * Mul
	pos = pos + self.VMLoc.y * Forward * Mul
	pos = pos + self.VMLoc.z * Up * Mul

	return pos, ang
end

SWEP.NextSecondaryAttack = 0

-----------------------------------------------------------
--	Silence Timings and Stuff
---------------------------------------------------------
function SWEP:Silence()

	if  self.Weapon:GetNetworkedBool("Silenced") == false then
		self:SetIronsights( false )
		self.Weapon:SetNetworkedBool("Silenced", true)
		self.Weapon:SendWeaponAnim( ACT_VM_ATTACH_SILENCER )
		self.CSMuzzleFlashes	= true

	else
		self.Weapon:SetNetworkedBool("Silenced", false)
		self:SetIronsights( false )
		self.Weapon:SendWeaponAnim( ACT_VM_DETACH_SILENCER )
		self.CSMuzzleFlashes	= true
	end

	self:SetIronsights( false )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.SilenceHolster + .1)
	self.Weapon:SetNextSecondaryFire( CurTime() + self.SilenceHolster + .5)
	self.Reloadaftershoot = CurTime() + 3
	self.Weapon:SetNetworkedInt("deploydelay", CurTime() + 3);
end


-----------------------------------------------------------
--	SecondaryAttack
---------------------------------------------------------

function SWEP:SecondaryAttack()
end

function SWEP:SetIronsights(b)


	--if self.Owner:KeyDown(IN_USE) then return end --- бег прицел

	--if self.Owner:KeyDown(IN_SPEED) then return end

	self.Weapon:SetNetworkedBool("Ironsights", b)

		if self.Weapon:GetNetworkedBool( "Ironsights", true) then
			self.Primary.Recoil = self.RecoilZoom
			self.IronSightsPos = self.AimSightsPos
			self.IronSightsAng = self.AimSightsAng
			self.Weapon:EmitSound("weapons/universal/iron_in.wav")
			self.Owner:SetFOV(self.ZoomFOV, 0.15)
				if self.CSSZoom then
					self.Primary.Recoil = self.RecoilZoom
					self.Primary.Delay  = self.DelayZoom
				end
		else
				self.Primary.Recoil = self.Recoil
				self.Owner:SetFOV(0, 0.15)
				if self.CSSZoom then
						self.Primary.Recoil = self.Recoil
						self.Primary.Delay  = self.Delay
				end
				self.Weapon:EmitSound("weapons/universal/iron_out.wav")
		end

end