

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "p228"
	SWEP.Author				= ""
	SWEP.Slot				= 1
	SWEP.SlotPos			= 0
	SWEP.IconLetterCSS		= "y"

	killicon.AddFont( "weapon_p228", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "pistol"
SWEP.Base				= "br_weapon_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel			= "models/weapons/w_pist_p228.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 47

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Primary.Sound			= Sound( "Weapon_p228.Single" )
SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 35
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 13
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 13
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.IronSightsPos = Vector(-5.98, 0.375, 3)
SWEP.IronSightsAng = Vector(-0.5, 0, 0)
SWEP.AimSightsPos = Vector(-5.98, 0.375, 3)
SWEP.AimSightsAng = Vector(-0.5, 0, 0)
SWEP.DashArmPos = Vector(0, 0, 0)
SWEP.DashArmAng = Vector(-10, 0, 0)

--Extras
SWEP.ReloadHolster			= 2.5
SWEP.StockIronSightAnim 	= true

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.015 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.02 -- Accuracy when we're walking
SWEP.AirCone				= 0.15 -- Accuracy when we're in air
SWEP.StandCone				= 0.01 -- Accuracy when we're standing still
SWEP.Recoil					= 3
SWEP.RecoilZoom				= 0.8
SWEP.Delay					= 0.08