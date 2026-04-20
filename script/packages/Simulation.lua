getgenv().isfakeclient = function() 
    local cid = getrawmetatable(import.RbxAnalyticsService)
    if isfunctionhooked(cid.__namecall) or isfunctionhooked(gethwid())then
        return true
    end
    return false
end

getgenv().Simulation = {Genesis = getchar()}
local simulationdata = {}

function Simulation.new(name)
local newsim = clonechar()
newsim.Name = name
simulationdata[name] = newsim 
local col = Instance.new("Highlight",simulationdata[name])
col.FillColor = Color3.fromRGB(math.random(50,255),math.random(50,255),math.random(50,255))
return simulationdata[name]
end

function simulationdata:SetChar()
getplayer().Character = self
task.wait()
workspace.Camera.CameraFocus = getchar()
end

function Simulation:GetGenesis()
if not getgenv().Simulation.Genesis then
warn("Can't find Genesis use :NewGenesis to make a new one")
return 
end
return  getgenv().Simulation.Genesis
end

function Simulation:NewGenesis()
replicatesignal(getplayer().Kill)
getgenv().Simulation.Genesis = getplayer().CharacterAdded:Wait()
end
