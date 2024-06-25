
if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Desert Eagle"
	SWEP.Author				= ""


	SWEP.IconLetterCSS			= "f"

	killicon.AddFont( "weapon_deagle", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "revolver"
SWEP.Base				= "br_weapon_base"
SWEP.Category			= "Counter-Strike Mini"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel			= "models/weapons/w_pist_deagle.mdl"
SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 45
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 1
SWEP.SlotPos			= 0

SWEP.Primary.Sound			= Sound( "Weapon_Deagle.Single" )
SWEP.Primary.Recoil			= 7
SWEP.Primary.Damage			= 60
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 7
SWEP.Primary.Delay			= 0.3
SWEP.Primary.DefaultClip	= 42
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"

SWEP.IronSightsPos = Vector(-6.365, -11.287, 2.134)
SWEP.IronSightsAng = Vector(0.056, 0, 0)
SWEP.AimSightsPos = Vector(-6.365, -11.287, 2.134)
SWEP.AimSightsAng = Vector(0.056, 0, 0)
SWEP.DashArmPos = Vector(0, 0, 0)
SWEP.DashArmAng = Vector(-10, 0, 0)


--Extras
SWEP.ReloadHolster			= 2
SWEP.ZoomFOV				= 85
SWEP.StockIronSightAnim		= true

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.08 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.01 -- Accuracy when we're standing still
SWEP.IronsightsCone			= 0.015
SWEP.Recoil 				= 7
SWEP.Delay					= 0.3
SWEP.DelayZoom				= 0.2
