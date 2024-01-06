MsgC(Color(179, 57, 57), '[Buy System | Items]', Color(255, 255, 255), ' - Shared side loaded.', '\n')

items_buymenu_rus = {
    Weapon_pack1 = {
        name = 'Штурмовая Винтовка',
        func_items = function(ply)
			if SERVER then
				if ply:Team() == TEAM_T then
				ply:StripWeapons()
				ply:StripAmmo()
				ply:GiveAmmo( 52 , "Pistol", true )
				ply:GiveAmmo( 90  , "ar2", true )
				ply:Give("weapon_knife")
				ply:Give("weapon_p228")
				ply:Give("weapon_sg552")
				sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
			elseif ply:Team() == TEAM_CT then
				ply:StripWeapons()
				ply:StripAmmo()
				ply:GiveAmmo( 52 , "Pistol", true )
				ply:GiveAmmo( 90  , "ar2", true )
				ply:Give("weapon_knife")
				ply:Give("weapon_p228")
				ply:Give("weapon_aug")
				sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
			end
			end
		end
    },
    Weapon_pack2 = {
        name = 'Снайперская Винтовка',
        func_items = function(ply)
			if SERVER then
				ply:StripWeapons()
				ply:StripAmmo()
				ply:GiveAmmo( 35 , "357", true )
				ply:GiveAmmo( 30 , "ar2", true )
				ply:Give("weapon_knife")
				ply:Give("weapon_deagle")
				ply:Give("weapon_awp")
				sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
			end
		end
    },
    -- Weapon_pack3 = {
    --     name = 'Бронежилет',
    --     func_items = function(ply)
	-- 		if SERVER then
	-- 			ply:SetArmor( 100 )
	-- 			ply:SetWalkSpeed( 210 )
	-- 			ply:SetRunSpeed( 100 )
	-- 			sound.Play("items/ammopickup.wav", Vector(ply:GetPos()))
	-- 		end
	-- 	end
    -- },
	-- Weapon_pack4 = {
    --     name = 'Снять Бронежилет',
    --     func_items = function(ply)
	-- 		if SERVER then
	-- 			ply:SetArmor( 0 )
	-- 			ply:SetWalkSpeed( 240 )
	-- 			ply:SetRunSpeed( 100 )
	-- 			sound.Play("items/ammopickup.wav", Vector(ply:GetPos()))
	-- 		end
	-- 	end
    -- },
	Weapon_pack5 = {
        name = 'Винтовка',
        func_items = function(ply)
			if SERVER then
				if ply:Team() == TEAM_T then
					ply:StripWeapons()
					ply:StripAmmo()
					ply:GiveAmmo( 120 , "Pistol", true )
					ply:GiveAmmo( 90 , "ar2", true )
					ply:Give("weapon_knife")
					ply:Give("weapon_glock")
					ply:Give("weapon_ak47")
					ply:Give("weapon_hegrenade")
					sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
				elseif ply:Team() == TEAM_CT then
					ply:StripWeapons()
					ply:StripAmmo()
					ply:GiveAmmo( 100 , "Pistol", true )
					ply:GiveAmmo( 90 , "ar2", true )
					ply:Give("weapon_knife")
					ply:Give("weapon_usp")
					ply:Give("weapon_m4a1")
					ply:Give("weapon_hegrenade")
					sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
				end
			end
		end
    },
	Weapon_pack6 = {
        name = 'Пистолет-пулемет',
        func_items = function(ply)
			if SERVER then
				if ply:Team() == TEAM_T then
				ply:StripWeapons()
				ply:StripAmmo()
				ply:GiveAmmo( 35  , "357", true )
				ply:GiveAmmo( 120 , "smg1", true )
				ply:Give("weapon_knife")
				ply:Give("weapon_deagle")
				ply:Give("weapon_mp5navy")
				ply:Give("weapon_flashbang")
				ply:Give("weapon_smokegrenade")
				ply:Give("weapon_hegrenade")
				sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
			elseif ply:Team() == TEAM_CT then
				ply:StripWeapons()
				ply:StripAmmo()
				ply:GiveAmmo( 35  , "357", true )
				ply:GiveAmmo( 100 , "smg1", true )
				ply:Give("weapon_knife")
				ply:Give("weapon_deagle")
				ply:Give("weapon_ump45")
				ply:Give("weapon_flashbang")
				ply:Give("weapon_smokegrenade")
				ply:Give("weapon_hegrenade")
				sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
			end
		end
	end
    },
	Weapon_pack7 = {
        name = 'Дробовик',
        func_items = function(ply)
			if SERVER then
				if ply:Team() == TEAM_T then
					ply:StripWeapons()
					ply:StripAmmo()
					ply:GiveAmmo( 100 , "Pistol", true )
					ply:GiveAmmo( 32 , "Buckshot", true )
					ply:Give("weapon_knife")
					ply:Give("weapon_fiveseven")
					ply:Give("weapon_m3")
					sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
				elseif ply:Team() == TEAM_CT then
					ply:StripWeapons()
					ply:StripAmmo()
					ply:GiveAmmo( 100 , "Pistol", true )
					ply:GiveAmmo( 32 , "Buckshot", true )
					ply:Give("weapon_knife")
					ply:Give("weapon_fiveseven")
					ply:Give("weapon_xm1014")
					sound.Play("items/gift_pickup.wav", Vector(ply:GetPos()))
				end
			end
		end
    },
}
