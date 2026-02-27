local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local function recolor(items, attr, color)
    items:SetAttribute(attr, color)
end
local location = player:WaitForChild("YetiFruitVFXColor")
local fruit = location:WaitForChild("Default")
local shifted = location:WaitForChild("Shifted")
local replStorage = game:GetService("ReplicatedStorage")
local Util = replStorage:WaitForChild("Util")
local Anim = Util:WaitForChild("Anims", 1).Storage["2"].Yeti
local TransformAnim = Anim.Transformed
TransformAnim.YetiTransZCharge.AnimationId = "rbxassetid://121744998067319"
TransformAnim.YetiTransZFire.AnimationId = "rbxassetid://130780318892433"
--code
local color1 = Color3.fromRGB(25,180,10)
local color2 = Color3.fromRGB(25,160,10)
local color3 = Color3.fromRGB(5,180,50)
local color4 = Color3.fromRGB(0,110,0)
local color5 = Color3.fromRGB(50,130,0)
local color6 = Color3.fromRGB(30,153,16)
local color7 = Color3.fromRGB(41,170,31)
local function praticleChanger(decent,types,color)
    for i,v in ipairs(decent:GetDescendants()) do
        if v:IsA(types) then
            v.Color = color
        end
    end
end
local newSequence = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 185, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 185, 50)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 130, 0))
}) 
recolor(shifted,"GrayscaleToColorStrength",1)
recolor(shifted,"GrayscaleToColorSequence",newSequence)
recolor(shifted,"Shifted_Color1",color1)
recolor(shifted,"Shifted_Color2",color2)
recolor(shifted,"Shifted_Color3",color3)
recolor(shifted,"Shifted_Color4",color4)
recolor(shifted,"Shifted_Color5",color5)
recolor(shifted,"Shifted_Color6",color6)
recolor(shifted,"Shifted_Color7",color7)
local function change(part,asset)
    part.TextureID = asset
    part.SurfaceAppearance:Destroy()
end
function changeBody()
task.wait()
local acc = char:WaitForChild("YetiRig")
local rig = acc:WaitForChild("YetiRig")
local poly1 = rig:WaitForChild("low poly.001")
local poly2 = rig:WaitForChild("low poly.002")
local poly3 = rig:WaitForChild("low poly.003")
local poly4 = rig:WaitForChild("low poly.004")
local poly5 = rig:WaitForChild("low poly.005")
local poly22 = rig:WaitForChild("low poly.022")
local poly47 = rig:WaitForChild("low poly.047")
local poly78 = rig:WaitForChild("low poly.078")
local mouth = rig:WaitForChild("MouthL")
local CCharge = rig:WaitForChild("CCharge")
local DashParticle = rig:WaitForChild("DashParticle")
local DashSmoke = rig:WaitForChild("DashSmoke")
local FCharge = rig:WaitForChild("FCharge")
poly1:Destroy()
poly3:Destroy()
poly4:Destroy()
poly22:Destroy()
poly47:Destroy()
praticleChanger(CCharge,"ParticleEmitter",newSequence)
praticleChanger(DashParticle,"ParticleEmitter",newSequence)
praticleChanger(DashSmoke,"ParticleEmitter",newSequence)
praticleChanger(FCharge,"ParticleEmitter",newSequence)
local aura = game:GetService("ReplicatedStorage").FX.YetiEffects.Walking
for l,n in ipairs(aura:GetChildren()) do
n:Destroy()
end
change(poly2,"rbxassetid://113547120412300")
change(poly5,"rbxassetid://86093666218459")
poly78.Color = Color3.fromRGB(25,200,25)
for i,v in ipairs(mouth:WaitForChild("MouthBamp"):GetChildren()) do
    if v:IsA("ParticleEmitter") then
        v.Color = newSequence
    end
end
end
if char:WaitForChild("YetiRig", 1) then
    changeBody()
end
char.ChildAdded:Connect(function(child)
    if child.Name == "YetiRig" then
        changeBody()
    end
end)
