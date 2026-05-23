local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local hidden = false
plr.Chatted:Connect(function(msg)
	if msg:lower() == "/hide" or msg:lower() == "/showgui" then
		hidden = not hidden
        -- chat "/hide" ya buat hide lah
        for _, gui in ipairs(gethui():GetChildren()) do
            if gui:IsA("ScreenGui") then
                gui.Enabled = not hidden
            end
        end
    end
end)
