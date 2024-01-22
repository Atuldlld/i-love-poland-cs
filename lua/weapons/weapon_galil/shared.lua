if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "IMI Galil"
	SWEP.Author				= ""

	SWEP.IconLetterCSS		= "v"

	killicon.AddFont( "weapon_galil", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ) )

end

SWEP.HoldType			= "ar2"
SWEP.Base				= "br_weapon_base"
SWEP.Category			= "Counter-Strike Mini"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= "models/weapons/cstrike/c_rif_galil.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_galil.mdl"
SWEP.ViewModelFOV		= 55
SWEP.UseHands			= true

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 2
SWEP.SlotPos			= 9

SWEP.Primary.Sound			= Sound( "Weapon_galil.Single" )
SWEP.Primary.Recoil			= 2.6
SWEP.Primary.Damage			= 27
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.017
SWEP.Primary.ClipSize		= 35
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 125
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-6.365, -5.996, 2.664)
SWEP.IronSightsAng = Vector(-0.489, -0.011, 0.07)
SWEP.AimSightsPos = Vector(-6.365, -5.996, 2.664)
SWEP.AimSightsAng = Vector(-0.489, -0.011, 0.07)
SWEP.DashArmPos = Vector(2.055, -4.206, -0.681)
SWEP.DashArmAng = Vector(-10.965, 37.062, -10.664)


--Extras
SWEP.ReloadHolster		= 2.8
SWEP.StockIronSightAnim		= false

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.015 -- Accuracy when we're standing still
SWEP.Delay					= 0.08
SWEP.Recoil					= 2.6
SWEP.RecoilZoom				= 0.7
SWEP.IronSightsCone			= 0.0001

/*---------------------------------------------------------
SetIronsights
---------------------------------------------------------*/
function SWEP:SetIronsights(b)


	if self.Owner:KeyDown(IN_USE) then return end

	if self.Owner:KeyDown(IN_SPEED) then return end

	if !self.Owner:OnGround() then return end

	self.Weapon:SetNetworkedBool("Ironsights", b)

		if self.Weapon:GetNetworkedBool( "Ironsights", true) then
			--self.Primary.Recoil = self.RecoilZoom
			self.IronSightsPos = self.AimSightsPos
			self.IronSightsAng = self.AimSightsAng
			self.Weapon:EmitSound("weapons/universal/iron_in.wav")
			self.Owner:SetFOV(self.ZoomFOV, 0.15)
				if self.CSSZoom then
					self.Primary.Recoil = self.RecoilZoom
					self.Primary.Delay  = self.DelayZoom
				end
		else
				self.Primary.Recoil = self.Recoil
				self.Owner:SetFOV(0, 0.15)
				if self.CSSZoom then
						self.Primary.Recoil = self.Recoil
						self.Primary.Delay  = self.Delay
				end
				self.Weapon:EmitSound("weapons/universal/iron_out.wav")
		end

end
