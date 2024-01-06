

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "M4A1"
	SWEP.Author				= ""

	SWEP.IconLetterCSS		= "w"

	killicon.AddFont( "weapon_m4a1", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "br_zoom_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_m4a1.mdl"
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 54
SWEP.UseHands			= true
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 2
SWEP.SlotPos			= 12

SWEP.Primary.Sound			= Sound( "Weapon_M4A1.Single" )
SWEP.SilencedSound			= Sound( "Weapon_M4a1.Silenced" )
SWEP.Primary.Recoil			= 2.5
SWEP.Primary.Damage			= 28
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-3.57, -6.375, 0)
SWEP.IronSightsAng = Vector(2.497, 0.05, 0.7)
SWEP.AimSightsPos = Vector(-3.57, -6.375, 0)
SWEP.AimSightsAng = Vector(2.497, 0.05, 0.7)
SWEP.DashArmPos = Vector(2.359, -2.6, -4.113)
SWEP.DashArmAng = Vector(-10.965, 37.062, -10.664)

--Extras
SWEP.ReloadHolster			= 2.9
SWEP.SilenceHolster			= 2
SWEP.StockIronSightAnim		= true

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.05 -- Accuracy when we're walking
SWEP.AirCone				= 0.15 -- Accuracy when we're in air
SWEP.StandCone				= 0.01 -- Accuracy when we're standing still
SWEP.Delay				= 0.1
SWEP.Recoil				= 2.5
SWEP.RecoilZoom			= 0.7
SWEP.IronSightsCone			= 0.01
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