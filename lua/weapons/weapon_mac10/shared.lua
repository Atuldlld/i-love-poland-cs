

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "MAC-10"
	SWEP.Author				= ""
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetterCSS		= "l"

	killicon.AddFont( "weapon_mac10", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "pistol"
SWEP.Base				= "br_zoom_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel			= "models/weapons/w_smg_mac10.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 47
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_mac10.Single" )
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.05
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.07
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.IronSightsPos = Vector(-6.185, -7.106, 0.885)
SWEP.IronSightsAng = Vector(0.601, -5.383, -8.29)
SWEP.AimSightsPos = Vector(-6.185, -7.106, 0.885)
SWEP.AimSightsAng = Vector(0.601, -5.383, -8.29)
SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 47.062, -10.664)

--Extras
SWEP.ReloadHolster			= 3.2
SWEP.StockIronSightAnim		= true

-- Accuracy
SWEP.CrouchCone				= 0.03 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.035 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.1 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.07 -- Accuracy when we're standing still
SWEP.IronSightsCone			= 0.01
SWEP.Recoil					= 5
SWEP.RecoilZoom				= 0.8
SWEP.Delay					= 0.07


