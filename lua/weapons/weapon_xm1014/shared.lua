if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Automatic Shotgun"
	SWEP.Author				= ""

	SWEP.IconLetterCSS		= "B"


	killicon.AddFont( "weapon_xm1014", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "shotgun"
SWEP.Base				= "br_shotgun_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_shot_xm1014.mdl"
SWEP.WorldModel			= "models/weapons/w_shot_xm1014.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 54
SWEP.Slot				= 2
SWEP.SlotPos			= 24
SWEP.Weight				= 10
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_xm1014.Single" )
SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 18  --6
SWEP.Primary.NumShots		= 6
SWEP.Primary.Cone			= 0.09
SWEP.Primary.ClipSize		= 7
SWEP.Primary.Delay			= 0.25
SWEP.Primary.DefaultClip	= 39
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "buckshot"

SWEP.IronSightsPos = Vector(-6.96, -4.329, 2.7)
SWEP.IronSightsAng = Vector(-0.2, -0.8, 0)
SWEP.AimSightsPos = Vector(-6.96, -4.329, 2.7)
SWEP.AimSightsAng = Vector(-0.2, -0.8, 0)
SWEP.DashArmPos = Vector(4.355, -7.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 47.062, -10.664)

--Extras
SWEP.ReloadHolster			= 3
SWEP.StockIronSightAnim		= true

--Accuracy
SWEP.Delay					= 0.25
SWEP.Recoil					= 3
SWEP.RecoilZoom				= 2

