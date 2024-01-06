
local CLASS = {}

CLASS.Base 					= "default"
CLASS.DisplayName			= "player"

--overrides the default class
CLASS.WalkSpeed 			= 240
CLASS.CrouchedWalkSpeed 	= 0.29
CLASS.RunSpeed				= 100
CLASS.DuckSpeed				= 0.39
CLASS.JumpPower				= 200
CLASS.MaxHealth				= 100
CLASS.StartHealth			= 100
CLASS.StartArmor			= 0
<<<<<<< HEAD
CLASS.DropWeaponOnDie		= true
=======
<<<<<<< HEAD
CLASS.DropWeaponOnDie		= true
=======
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d

function CLASS:Loadout( pl )

end

player_class.Register( "player", CLASS )
