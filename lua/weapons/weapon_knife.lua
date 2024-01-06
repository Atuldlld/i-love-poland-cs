if ( CLIENT ) then

	SWEP.IconLetterCSS 		= "j"

	killicon.AddFont( "weapon_knife", "CSKillIcons", SWEP.IconLetterCSS, Color( 255, 80, 0, 255 ))
	SWEP.BounceWeaponIcon = false
end

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
SWEP.Weight = 0
SWEP.Slot				= 0
SWEP.SlotPos			= 25

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
SWEP.WalkSpeed = 240
SWEP.RunSpeed = 100

SWEP.Primary.Sound = Sound( "Weapon_Knife.Single" )
SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = 15
SWEP.Primary.Delay = 0.4
SWEP.Primary.Force = 1000

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Damage = 65
SWEP.Secondary.Delay = 1
SWEP.Secondary.Force = 2000

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 1
end

function SWEP:DrawHUD()
-- local x = ScrW() / 2
-- local y = ScrH() / 2
-- surface.SetDrawColor( 0, 255, 0, 255 )
-- surface.DrawLine( x - self.Weapon:GetNWString( "Crosshair1", 16 ), y, x - self.Weapon:GetNWString( "Crosshair2", 8 ), y )
-- surface.DrawLine( x + self.Weapon:GetNWString( "Crosshair1", 16 ), y, x + self.Weapon:GetNWString( "Crosshair2", 8 ), y )
-- surface.DrawLine( x, y - self.Weapon:GetNWString( "Crosshair1", 16 ), x, y - self.Weapon:GetNWString( "Crosshair2", 8 ) )
-- surface.DrawLine( x, y + self.Weapon:GetNWString( "Crosshair1", 16 ), x, y + self.Weapon:GetNWString( "Crosshair2", 8 ) )
end

function SWEP:Deploy()
self:SetWeaponHoldType( self.HoldType )
if SERVER then
self.Owner:EmitSound( "Weapon_Knife.Deploy" )
end
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self:SetNextPrimaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self:SetNextSecondaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self.Attack = 0
self.AttackTimer = CurTime()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
-- self.Owner:SetWalkSpeed( self.WalkSpeed )
-- self.Owner:SetRunSpeed( self.RunSpeed )
return true
end

function SWEP:Holster()
self.Attack = 0
self.AttackTimer = CurTime()
self.Idle = 0
self.IdleTimer = CurTime()
-- self.Owner:SetWalkSpeed( 240 )
-- self.Owner:SetRunSpeed( 100 )
return true
end

function SWEP:PrimaryAttack()
self:EmitSound( self.Primary.Sound )
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:SetAnimation( PLAYER_ATTACK1 )
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
self.Attack = 1
self.AttackTimer = CurTime() + 0.1
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:SecondaryAttack()
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
local dmginfo = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )
local angle = self.Owner:GetAngles().y - tr.Entity:GetAngles().y
if angle < -180 then
angle = 360 + angle
end
if angle <= 90 and angle >= -90 then
dmginfo:SetDamage( 195 )
else
dmginfo:SetDamage( self.Secondary.Damage )
end
dmginfo:SetDamageForce( self.Owner:GetForward() * self.Secondary.Force )
tr.Entity:TakeDamageInfo( dmginfo )
end
if !tr.Hit then
self:EmitSound( self.Primary.Sound )
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
end
if tr.Hit then
if SERVER then
if tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
self.Owner:EmitSound( "Weapon_Knife.Stab" )
end
if !( tr.Entity:IsPlayer() || tr.Entity:IsNPC() ) then
self.Owner:EmitSound( "Weapon_Knife.HitWall" )
end
end
self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
end
self.Owner:SetAnimation( PLAYER_ATTACK1 )
self:SetNextPrimaryFire( CurTime() + self.Secondary.Delay )
self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:Reload()
end

function SWEP:Think()
if self.Attack == 1 and self.AttackTimer <= CurTime() then
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 72,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 72,
filter = self.Owner,
mins = Vector( -16, -16, 0 ),
maxs = Vector( 16, 16, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER then
if IsValid( tr.Entity ) then
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
if tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
self.Owner:EmitSound( "Weapon_Knife.Hit" )
end
if !( tr.Entity:IsPlayer() || tr.Entity:IsNPC() ) then
self.Owner:EmitSound( "Weapon_Knife.HitWall" )
end
end
end
self.Attack = 0
end
if SERVER then
if self.Owner:IsOnGround() then
if self.Owner:GetVelocity():Length() <= 100 then
self.Weapon:SetNWString( "Crosshair1", 16 )
self.Weapon:SetNWString( "Crosshair2", 8 )
end
if self.Owner:GetVelocity():Length() > 100 then
self.Weapon:SetNWString( "Crosshair1", 22 )
self.Weapon:SetNWString( "Crosshair2", 14 )
end
end
if !self.Owner:IsOnGround() then
self.Weapon:SetNWString( "Crosshair1", 30 )
self.Weapon:SetNWString( "Crosshair2", 22 )
end
end
if self.Idle == 0 and self.IdleTimer < CurTime() then
if SERVER then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self.Idle = 1
end
end


function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	draw.SimpleText( self.IconLetterCSS, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )

end