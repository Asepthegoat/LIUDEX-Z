local gameVar1 = game:GetService("Players")
local gameVar2 = gameVar1.LocalPlayer
local gameVar3 = game:GetService("UserInputService")
local gameVar4 = game:GetService("TweenService")
local gameVar5 = game:GetService("HttpService") 
local gameVar6 = game:GetService("ReplicatedStorage")
local gameVar7 = game:GetService("StarterGui")
getgenv().LDXZSet = {
  players = gameVar1,
  player = gameVar2,
  UIS = gameVar3,
  TS = gameVar4,
  Http = gameVar5,
  Replicated = gameVar6,
  StarterGui = gameVar7
}
_G.LDXServices = getgenv().LDXZSet
function getchar()
  return getgenv().gameNewVar.player.Character
end

function run_on_func(func, run)
    local oldfunc
    oldfunc = hookfunction(func, function(self,...)
    local args = {...}
        task.spawn(function()
            run(self,args)
        end)
        return oldfunc(self, ...)
    end)
end

function run_on_method(methodname, run, selv)
    local oldmethod
    local h = selv or game
    oldmethod = hookmetamethod(h, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if method == methodname then
            task.spawn(function()
                run(self,args)
            end)
        end
        return oldmethod(self, ...)
    end)
end
-- functionnya harus di definisiin dlu gk bisa langsung
run_on_func(warn, print)
run_on_method("GetService",print) 
warn("halo dunia")
print(game:GetService("Players").LocalPlayer.Name)

function insertrbxmx(file)
local objects = game:GetObjects(getcustomasset(file))
local model = objects[1]
return model
end

function loadhttpscript(sc)
   loadstring(game:HttpGet(sc))()
end

function getpath(var)
  return var:GetFullName()
end

function uid(bol)
  if bol then
    local guid = getgenv().LDXZSet.Http:GenerateGUID(false)
    local uuid = guid:gsub("-","")
    return uuid
  else
    return getgenv().LDXZSet.Http:GenerateGUID(false)
  end
end

function JSONDecode(val)
  return getgenv().LDXZSet.Http:JSONDecode(val)
end

function JSONEncode(val)
  return getgenv().LDXZSet.Http:JSONEncode(val)
end
function postjson(uri,json)
	request({
			Url = uri,
			Method = "POST",
			Head = {["Content-type"] = "application/json"},
			Body = json or JSONEncode(json)
		})
end
-- method 

ex = {}
ex.__index = ex
function ex.new()
    local self = setmetatable({}, ex)
    return self
end
function ex:GetPlayTime()
  t = math.floor(game.Workspace.DistributedGameTime)
  return t
end

function ex:Respawn()
	getgenv().LDXZSet.player.Character.Humanoid.Health = 0
end

function ex:TriggerEvent(event,data)
	if event == "proximity" then
		fireproximityprompt(data)
	elseif event == "touch" then
		firetouchinterest(getgenv().LDXZSet.player.Character.HumanoidRootPart,data,0)
		firetouchinterest(getgenv().LDXZSet.player.Character.HumanoidRootPart,data,1)
	end
end

function ex:HttpScript(script)
  loadstring(game:HttpGet(script))()
end
77
liudex = {}
liudex.__index = liudex

function liudex.new(name,prop)
	local self = setmetatable({}, liudex)
	self.Name = name
  self.Property = prop
	return self
end
function liudex:SetProperty(prop)
  self.Property = prop
end
function liudex:GetName()
	print(self.Name)
end
function liudex:Respawn()
	getgenv().LDXZSet.player.Character.Humanoid.Health = 0
end
function liudex:GetProperty()
	return self.Property
end
function liudex:Notify(title,text,icon,button1,button2,duration,callback)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
            Title = title,
            Icon = icon or nil, -- contoh ikon notifikasi default
            Text = text or "" or nil,
            Duration = 5,
            Callback = callback or nil,
            Button1 = button1 or "Close",
            Button2 = button2 or nil,
})
end
LDXSignal = {}
LDXSignal.__index = LDXSignal

function LDXSignal.new(name)
	local self = setmetatable({}, LDXSignal)
	self.Name = name
	self._connections = {} -- tempat simpan callback
	return self
end

function LDXSignal:Fire(...)
	for _, callback in ipairs(self._connections) do
		callback(...)
	end
end

function LDXSignal:OnRecive(callback)
	table.insert(self._connections, callback)
end

return {
	ex = ex,
    liudex = liudex
}
