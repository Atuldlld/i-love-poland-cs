

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "M249"
	SWEP.Author				= ""
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetterCSS		= "z"

	killicon.AddFont( "weapon_m249", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "br_weapon_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel			= "models/weapons/w_mach_m249para.mdl"
SWEP.ViewModelFOV		= 55
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Primary.Sound			= Sound( "Weapon_m249.Single" )
SWEP.Primary.Recoil			= 6
SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.07
SWEP.Primary.ClipSize		= 100
SWEP.Primary.Delay			= 0.09
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.IronSightsPos = Vector(-5.935, -6.31, 2.3)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.AimSightsPos = Vector(-5.935, -6.31, 2.3)
SWEP.AimSightsAng = Vector(0, 0, 0)
SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 47.062, -10.664)

--Extras
SWEP.ReloadHolster			= 5.7
SWEP.StockIronSightAnim		= false

-- Accuracy
SWEP.CrouchCone				= 0.04 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.055 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.15 -- Accuracy when we're walking
SWEP.AirCone				= 0.2 -- Accuracy when we're in air
SWEP.StandCone				= 0.07 -- Accuracy when we're standing still
SWEP.IronSightsCone			= 0.01
SWEP.Delay					= 0.09
SWEP.Recoil					= 6
SWEP.RecoilZoom				= 1