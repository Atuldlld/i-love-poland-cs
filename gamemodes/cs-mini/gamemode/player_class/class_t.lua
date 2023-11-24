
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Подразделение Феникс" --"Phoenix Connexion"
CLASS.Description       = "Известные тем, что убивают любого, кто встает у них на пути. Подразделение Феникс - одна из наиболее опасных террористических группировок в Восточной Европе. Группировка сформировалась вскоре после развала СССР."
CLASS.PlayerModel		= {"models/player/phoenix.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_knife" )
pl:Give( "weapon_glock" )
pl:GiveAmmo( 120 , "Pistol", true )
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.3,.4,.8));
end

player_class.Register( "t_terror", CLASS )

-------------------------------------------

local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Элитное подразделение" --"Elite Crew "
CLASS.Description       = "Фундаменталистская группировка из Средней Азии, \nстремящаяся к мировому господству \nи совершающая различные преступления."
CLASS.PlayerModel		= {"models/player/leet.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_knife" )
pl:Give( "weapon_glock" )
pl:GiveAmmo( 120 , "Pistol", true )
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.3,.6,.3));
end

player_class.Register( "t_leet", CLASS )

-------------------------------------------

local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Арктические мстители" --"Arctic Avengers"
CLASS.Description       = "Шведская террористическая группа, появилась в 1977 г. \nИзвестна взрывом посольства Канады в 1990 г."
CLASS.PlayerModel		= {"models/player/arctic.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_knife" )
pl:Give( "weapon_glock" )
pl:GiveAmmo( 120 , "Pistol", true )
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "t_arctic", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Партизаны" --"Guerilla Warfare "
CLASS.Description       = "Террористическая группировка, образовалась на Среднем Востоке. \nЭта группировка известна своей жестокостью.\nСвое отвращение к американскому образу жизни они \nпродемонстрировали в 1982 году,  бросив бомбу \nв автобус с несколькими рок-н-ролльными группами."
CLASS.PlayerModel		= {"models/player/guerilla.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_knife" )
pl:Give( "weapon_glock" )
pl:GiveAmmo( 120 , "Pistol", true )
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.7,.3,.3));
end

player_class.Register( "t_guerilla", CLASS )