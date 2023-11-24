

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "ES C90"
	SWEP.Author				= "oTvErTkA"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 3
	SWEP.IconLetterCSS		= "m"

	killicon.AddFont( "weapon_p90", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "smg"
SWEP.Base				= "br_zoom_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel			= "models/weapons/w_smg_p90.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_p90.Single" )
SWEP.Primary.Recoil			= 2
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.ClipSize		= 50
SWEP.Primary.Delay			= 0.07
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 47.062, -10.664)

--Extras
SWEP.ReloadHolster			= 3.2
-- Accuracy
SWEP.CrouchCone				= 0.025 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.03 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.04 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.04 -- Accuracy when we're standing still
SWEP.Delay					= 0.07

SWEP.UseScope				= true
SWEP.ScopeZoom				= 3
SWEP.BoltAction				= false
SWEP.ScopeReddot			= true
SWEP.CrossHair				= true