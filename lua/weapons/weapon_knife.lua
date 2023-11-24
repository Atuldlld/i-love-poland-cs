if ( CLIENT ) then

	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
	SWEP.IconLetterCSS 		= "j"

	killicon.AddFont( "br_knife", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ))
	SWEP.BounceWeaponIcon = false
end

local DrawSound 				= Sound ("weapons/knife/knife_deploy1.wav");
local SwingSound 				= Sound ("weapons/iceaxe/iceaxe_swing1.wav");



SWEP.PrintName = "Knife"
SWEP.Category = "Counter-Strike Mini"
SWEP.Author	= "oTvErTkA"
SWEP.Spawnable= true
SWEP.AdminSpawnable= true
SWEP.AdminOnly = false

SWEP.ViewModelFOV = 55
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.ViewModelFlip = false
SWEP.BobScale = 1
SWEP.SwayScale = 0

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 1
SWEP.Slot = 2
SWEP.SlotPos = 0

SWEP.UseHands = true
SWEP.HoldType = "knife"
SWEP.FiresUnderwater = true
SWEP.DrawCrosshair = true
SWEP.DrawAmmo = true
SWEP.CSMuzzleFlashes = 1
SWEP.Base = "weapon_base"


SWEP.Attack = 0
SWEP.AttackTimer = CurTime()
SWEP.Idle = 0
SWEP.IdleTimer = CurTime()

SWEP.Primary.Sound = Sound( "" )
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = 60
SWEP.Primary.Delay = 0.4
SWEP.Primary.Force = 2000

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"


function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	if ( SERVER ) then
		self:SetWeaponHoldType(self.HoldType)
	end
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Weapon:EmitSound( DrawSound )
end

function SWEP:Holster()
   --self.Weapon:EmitSound( DrawSound )
   return true
end

function SWEP:PrimaryAttack()
self:EmitSound( SwingSound )
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:SetAnimation( PLAYER_ATTACK1 )
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
self.Attack = 1
self.AttackTimer = CurTime() + 0.2
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()


end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:Think()
self.Owner:GetViewModel():SetSkin(0)
if self.Attack == 1 and self.AttackTimer <= CurTime() then
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mins = Vector( -16, -16, 0 ),
maxs = Vector( 16, 16, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER and IsValid( tr.Entity ) then
local dmg = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmg:SetAttacker( attacker )
dmg:SetInflictor( self )
dmg:SetDamage( self.Primary.Damage )
dmg:SetDamageForce( self.Owner:GetForward() * self.Primary.Force )
tr.Entity:TakeDamageInfo( dmg )
end
if tr.Hit then
if SERVER then
if tr.Entity:IsNPC() || tr.Entity:IsPlayer() then
self.Owner:EmitSound( "weapons/knife/knife_hit1.wav" )
end
if !( tr.Entity:IsNPC() || tr.Entity:IsPlayer() ) then
self.Owner:EmitSound( "weapons/knife/knife_hitwall1.wav" )
end
end
end
self.Attack = 0
end
if self.Idle == 0 and self.IdleTimer <= CurTime() then
if SERVER then

end
self.Idle = 0
end
end

function SWEP:DoImpactEffect( tr, dmgtype )
    return true;
end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	draw.SimpleText( self.IconLetterCSS, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )

end