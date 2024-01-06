
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Морские котики США" --"SEAL TEAM 6"
CLASS.Description       = "Подразделение морских котиков 6 (позже известное под DEVGRU) образовалось\n в 1980 под командыванием капитан-лейтенанта Ричарда Марсинко. \nST-6 находилась в постоянной готовности пресечь по тревоге любые \nтеррористические акты в любой точке мира, направленные против Америки."
CLASS.PlayerModel		= {"models/player/urban.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetSkin(0)
	pl:SetupHands()
end

player_class.Register( "ct_urban", CLASS )

-------------------------------------------

local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Германский спецназ" --"GSG-9 "
CLASS.Description       = "Подразделение GSG-9 появилось в ходе трагических событий\nна Олимпийских играх1972 года в Мюнхене (Германия), приведших к\nгибели нескольких атлетов из Израиля."
CLASS.PlayerModel		= {"models/player/riot.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_gsg9", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Великобританский спецназ" --"SAS "
CLASS.Description       = "Всемирно известное подразделение САС было образовано Дэвидом Стирлингом\nво время Второй Мировой войны. Его роль во время войны заключалась в сборе\nразведанных в тыле врага, организации саботажа и убийств на ключевых\nобъектах противника."
CLASS.PlayerModel		= {"models/player/gasmask.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_sas", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Французский спецназ" --"GIGN "
CLASS.Description       = "Элитное  подразделение Франции - GIGN -\nсилы быстрого реагирования, способные противостоять любому\nкрупномасштабному террористическому инциденту.\nНесмотря на малую численность (около 100 человек) GIGN заработала\nхорошую репутацию, проведя множество успешных\nконтртеррористических операций."
CLASS.PlayerModel		= {"models/player/swat.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_gign", CLASS )