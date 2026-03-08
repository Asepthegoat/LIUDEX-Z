local location = game:GetService("Players").LocalPlayer:WaitForChild("PortalFruitVFXColor")
local fruit = location:WaitForChild("Default")
local shifted = location:WaitForChild("Shifted")

function recolor(items, attr, color)
    items:SetAttribute(attr, color)
end

local a,b,c = 255,255,255
local d,e,f = 40,0,0
local g,h,i = 70,0,0
local color = Color3.fromRGB(a,b,c)
local color2 = Color3.fromRGB(d,e,f)
local color3 = Color3.fromRGB(g,h,i)
recolor(fruit, "Default_Color1", color)
recolor(fruit,"Default_Color2", color)
recolor(fruit,"Default_Color3", color)
recolor(fruit, "Default_Color4", color)
recolor(fruit, "Default_Color5", color)
recolor(fruit,"Default_Color6", color)
recolor(fruit,"Default_Color7", color)
recolor(shifted,"Shifted_Color1",color3)
recolor(shifted,"Shifted_Color2",color2)
recolor(shifted,"Shifted_Color3",color2)
recolor(shifted,"Shifted_Color4",color2)
recolor(shifted,"Shifted_Color5",color2)
recolor(shifted,"Shifted_Color6",color2)
recolor(shifted,"Shifted_Color7",color2)
