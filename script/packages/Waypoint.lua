getgenv().Waypoint = {}

local Priority = ""
function Waypoint.new(key,cframe)
Waypoint[key] = cframe or getchar().HumanoidRootPart.CFrame
return Waypoint[key], cframe or getchar().HumanoidRootPart.CFrame
end

function Waypoint:GoTo(key)
getchar().HumanoidRootPart.CFrame = Waypoint[key]
end

function Waypoint:TweenTo(key,speed)
    local tw = import.TweenService
    local HRP = getchar().HumanoidRootPart
    local time = (HRP.Position - Waypoint[key].Position).Magnitude / speed
    local tinfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    local tween = tw:Create(HRP,tinfo,{CFrame = Waypoint[key]})
    tween:Play()
end

function Waypoint:MoveTo(key)
    gethumanoid():MoveTo(Waypoint[key].Position)
end

function Waypoint:Get(key)
    return Waypoint[key]
end

function Waypoint:GetDistance(key)
    return (getchar().HumanoidRootPart.Position - Waypoint[key].Position).Magnitude 
end

function Waypoint:GetAll()
    local tb = {}
    for i,v in pairs(Waypoint) do
        tb[i] = v
    end
    return tb
end

function Waypoint:SetSpawnLocation(key) -- it's like sethome or setspawnpoint
    Priority = key
end

function Waypoint:Remove(key)
    Waypoint[key] = nil
    return true
end

getplayer().CharacterAdded:Connect(function(char)
task.wait()
if Priority or Priority ~= "" then
pcall(function() 
    getchar():WaitForChild("HumanoidRootPart").CFrame = Waypoint[Priority] 
end) --idk why it throw an error but the code is still run i use pcall just to hide the error msg
end
end)
