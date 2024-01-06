

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Five-Seven"
	SWEP.Author				= ""

	SWEP.IconLetterCSS		= "u"

	killicon.AddFont( "weapon_fiveseven", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "pistol"
SWEP.Base				= "br_weapon_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_pist_fiveseven.mdl"
SWEP.WorldModel			= "models/weapons/w_pist_fiveseven.mdl"
SWEP.ViewModelFOV		= 47
SWEP.UseHands 			= true
SWEP.ViewModelFlip		= false
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 1
SWEP.SlotPos			= 7

SWEP.Primary.Sound			= Sound( "Weapon_FiveSeven.Single" )
SWEP.Primary.Recoil			= 2.5
SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.09
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.IronSightsPos = Vector(-5.95, -6.375, 3)
SWEP.IronSightsAng = Vector(-0.5, 0, 0)
SWEP.AimSightsPos = Vector(-5.95, -6.375, 3)
SWEP.AimSightsAng = Vector(-0.5, 0, 0)
SWEP.DashArmPos = Vector(0, 0, 0)
SWEP.DashArmAng = Vector(-10, 0, 0)

--Extras
SWEP.ReloadHolster			= 3
SWEP.StockIronSightAnim		= true

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.015 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.04 -- Accuracy when we're walking
SWEP.AirCone				= 0.085 -- Accuracy when we're in air
SWEP.StandCone				= 0.01 -- Accuracy when we're standing still
SWEP.Recoil					= 2.5
SWEP.RecoilZoom				= 0.7
SWEP.Delay					= 0.09
