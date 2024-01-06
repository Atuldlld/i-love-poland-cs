

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Pump Shotgun"
	SWEP.Author				= ""

	SWEP.IconLetterCSS		= "k"

	killicon.AddFont( "weapon_m3", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "shotgun"
SWEP.Base				= "br_shotgun_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel			= "models/weapons/w_shot_m3super90.mdl"
SWEP.ViewModelFlip	    = false
SWEP.ViewModelFOV       = 46
SWEP.UseHands		 	= true
SWEP.Slot				= 2
SWEP.SlotPos			= 0
SWEP.Weight				= 11
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Primary.Sound			= Sound( "Weapon_m3.Single" )
SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 25 --17
SWEP.Primary.NumShots		= 7
SWEP.Primary.Cone			= 0.1
SWEP.Primary.ClipSize		= 8
SWEP.Primary.Delay			= 0.9
SWEP.Primary.DefaultClip	= 40
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "buckshot"

SWEP.IronSightsPos = Vector(-7.644, -4.115, 3.5)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.AimSightsPos = Vector(-7.644, -4.115, 3.5)
SWEP.AimSightsAng = Vector(0, 0, 0)
SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 47.062, -10.664)

SWEP.StockIronSightAnim		= true

SWEP.Delay					= 0.9
SWEP.Recoil					= 3
SWEP.RecoilZoom				= 2
