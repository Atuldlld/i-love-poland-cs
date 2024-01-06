

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "USP"
	SWEP.Author				= ""
	SWEP.IconLetterCSS		= "a"

	killicon.AddFont( "weapon_usp", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "pistol"
SWEP.Base				= "br_zoom_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel			= "models/weapons/w_pist_usp.mdl"
SWEP.ViewModelFlip		= false
SWEP.UseHands			= true
SWEP.ViewModelFOV		= 47
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 1
SWEP.SlotPos			= 0

SWEP.Primary.Sound			= Sound( "Weapon_usp.Single" )
SWEP.SilencedSound			= Sound( "Weapon_usp.SilencedShot" )
SWEP.Primary.Recoil			= 2
SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 12
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 112
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-3.57, -6.375, 0)
SWEP.IronSightsAng = Vector(2.497, 0.05, 0.7)
SWEP.AimSightsPos = Vector(-3.57, -6.375, 0)
SWEP.AimSightsAng = Vector(2.497, 0.05, 0.7)
SWEP.DashArmPos = Vector(0, 0, 0)
SWEP.DashArmAng = Vector(-10, 0, 0)

--Extras
SWEP.ReloadHolster			= 2.4
SWEP.SilenceHolster			= 2.9
SWEP.StockIronSightAnim		= true

-- Accuracy
SWEP.CrouchCone				= 0.005 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.01 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.02 -- Accuracy when we're walking
SWEP.AirCone				= 0.07 -- Accuracy when we're in air
SWEP.StandCone				= 0.01 -- Accuracy when we're standing still
SWEP.Recoil					= 2
SWEP.Delay					= 0.08
SWEP.DelayZoom				= 0.08
SWEP.IronSightsCone			= 0.015
SWEP.Silenceable			= true
SWEP.SilenceTiming			= 2

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

function SWEP:SecondaryAttack()


	if self.Owner:KeyDown(IN_ATTACK2) and (self.Silenceable) then

	self:SetNWInt("skipthink", true)
	timer.Simple(self.SilenceHolster,
		function()
		if self.Weapon == nil then return end
		self:SetNWInt("skipthink", false)
	end)
	//Skip the entire Think Function

	self:SetIronsights( false )
	//Set the ironsight to false

	self:Silence()

	self.Owner:SetFOV(0, 0.15)
	self.Primary.Recoil = self.Recoil

	end

	--if not self.Owner:OnGround() then return end
	if self.Owner:KeyDown(IN_SPEED) then return end
	if self.Owner:KeyDown(IN_USE) then return end

	if ( self.NextSecondaryAttack > CurTime() ) then return end

	bIronsights = !self.Weapon:GetNetworkedBool( "Ironsights", false )

	--self:SetIronsights( bIronsights )

	self.NextSecondaryAttack = CurTime() + 0.3

end