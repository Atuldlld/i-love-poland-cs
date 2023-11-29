MsgC(Color(179, 57, 57), '[Buy System | Server]', Color(255, 255, 255), ' - Server side loaded.', '\n')

util.AddNetworkString('MenuOpen')
util.AddNetworkString('InitializeGiveWeapon')

-- local function MenuInitialize(ply, text)

--     if string.lower(text) == '!buymenu' then
--         net.Start('MenuOpen')
--         net.Send(ply)
--     end

-- end

hook.Add('PlayerSay', 'MenuInitialize', MenuInitialize)

net.Receive('InitializeGiveWeapon', function(len, ply)

    local name = net.ReadString()

    if not items_buymenu_eng[name] then
        return
    end

    local data = items_buymenu_eng[name]
	data.func_items(ply)

end)

-- hook.Add( "ShowSpare2", "MenuInitialize", function( ply, key )
-- 		net.Start('MenuOpen')
--         net.Send(ply)
-- end )

hook.Add( "PlayerLoadout", "MenuInitialize", function( ply, key )
	net.Start('MenuOpen')
    net.Send(ply)
end )