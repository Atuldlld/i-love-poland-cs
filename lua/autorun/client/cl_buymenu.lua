MsgC(Color(179, 57, 57), '[Buy System | Menu]', Color(255, 255, 255), ' - Client side loaded.', '\n')

net.Receive('MenuOpen', function(len, ply)
    local MenuPerk = vgui.Create('DFrame')
    MenuPerk:SetSize(600, 400)
    MenuPerk:SetTitle(SimpleCFG.MenuTitle)
    MenuPerk:SetVisible(true)
    MenuPerk:SetDraggable(true)
    MenuPerk:ShowCloseButton(false)
    MenuPerk:MakePopup()
    MenuPerk:Center()
    MenuPerk.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, 600, 400, Color(0, 0, 0, 210))
        draw.RoundedBoxEx(8, 0, 0, 600, 25, Color(52, 73, 94), true, true, false, false)
    end
    local scroll = vgui.Create("DScrollPanel", MenuPerk)
    scroll:Dock(FILL)
    local scrollbar = scroll:GetVBar()
    scrollbar.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 210))
    end
    scrollbar.btnUp.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBox(0, 0, 0, w, h, Color(146, 29, 29))
        else
            draw.RoundedBox(0, 0, 0, w, h, Color(173, 26, 26))
        end
    end
    scrollbar.btnDown.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBox(0, 0, 0, w, h, Color(146, 29, 29))
        else
            draw.RoundedBox(0, 0, 0, w, h, Color(173, 26, 26))
        end
    end
    scrollbar.btnGrip.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBox(0, 0, 0, w, h, Color(72, 29, 29))
        else
            draw.RoundedBox(0, 0, 0, w, h, Color(105, 38, 38))
        end
    end
    for name, class in pairs(items_buymenu) do
        local PerksBTN = vgui.Create('DButton', scroll)
        PerksBTN:SetText(class.name)
        PerksBTN:SetTextColor(Color(192, 192, 192))
        PerksBTN:Dock(TOP)
        PerksBTN:DockMargin(0, 0, 0, 5)
        PerksBTN:SetSize(0, 40)
        PerksBTN:SetFont('ButtonBuy')
        PerksBTN.Paint = function(self, w, h)
            if self:IsHovered() then
                PerksBTN:SetTextColor(Color(255, 255, 255))
                draw.RoundedBox(4, 0, 0, w, h, Color(179, 57, 57))
            else
                draw.RoundedBox(4, 0, 0, w, h, Color(152, 44, 44))
                PerksBTN:SetTextColor(Color(192, 192, 192))
            end
        end
        PerksBTN.DoClick = function()
            net.Start('InitializeGiveWeapon')
                net.WriteString(name)
            net.SendToServer()
        end
    end
    local MenuClose = vgui.Create('DButton', MenuPerk)
    MenuClose:SetText("X")
    MenuClose:SetTextColor(Color(255, 255 ,255))
    MenuClose:SetPos(550, 0)
    MenuClose:SetSize(50, 25)
    MenuClose:SetFont('ButtonFontTop')
    MenuClose.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBoxEx(8, 0, 0, w, h, Color(179, 57, 57), false, true, false, false)
        else
            draw.RoundedBoxEx(8, 0, 0, w, h, Color(152, 44, 44), false, true, false, false)
        end
    end
    MenuClose.DoClick = function()
        MenuPerk:SetVisible(!MenuPerk:IsVisible())
    end
end)