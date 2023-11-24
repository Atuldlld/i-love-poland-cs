if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Krieg 552"
	SWEP.Author				= "oTvErTkA"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 1
	SWEP.IconLetterCSS			= "A"

	killicon.AddFont( "weapon_sg552", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "br_zoom_base"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Category			= "Counter-Strike Mini"

SWEP.ViewModel			= "models/weapons/cstrike/c_rif_sg552.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_sg552.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 60
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_sg552.Single" )
SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.09
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.Automatic	= true

SWEP.IronSightsPos 		= Vector( 0, 0, 0 )
SWEP.IronSightsAng 		= Vector( 0, 0.0, 0 )
SWEP.AimSightsPos 		= Vector( 0, 0, 0 )
SWEP.AimSightsAng 		= Vector( 0, 0.0, 0 )
SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 37.062, -10.664)

--Extras
SWEP.ReloadHolster			= 2.7
SWEP.ZoomFOV				= 55
SWEP.CSSZoom				= true
SWEP.StockIronSightAnim		= true

-- Weapon Variations
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.015 -- Accuracy when we're standing still
SWEP.IronsightsCone			= 0.015
SWEP.Recoil				= 3	-- Recoil For not Aimed
SWEP.RecoilZoom				= 0.7	-- Recoil For Zoom
SWEP.Delay				= 0.09	-- Delay For Not Zoom
SWEP.DelayZoom				= 0.15	-- Delay For Zoom

function SWEP:SecondaryAttack()


	if self.Owner:KeyDown(IN_USE) and (self.Silenceable) then

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
	--if self.Owner:KeyDown(IN_SPEED) then return end
	--if self.Owner:KeyDown(IN_USE) then return end

	if ( self.NextSecondaryAttack > CurTime() ) then return end

	bIronsights = !self.Weapon:GetNetworkedBool( "Ironsights", false )

	self:SetIronsights( bIronsights )

	self.NextSecondaryAttack = CurTime() + 0.3

end