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
local olderrPromptbackground = Color3.fromRGB(57, 59, 61)
local olderrOverlaybackground = Color3.fromRGB(0, 0, 0)
local olderrButtonColor = Color3.fromRGB(255, 255, 255)
--new error data
local newerrPromptbackground = Color3.fromRGB(40, 0, 77)
local newerrOverlaybackground = Color3.fromRGB(25, 5, 55)
local newerrButtonColor = Color3.fromRGB(150, 60, 255)

function getchar()
  return getgenv().LDXZSet.player.Character
end

function getplayer()
  return getgenv().LDXZSet.player
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

function insertasset(assetid)
local objects = game:GetObjects(assetid)
local model = objects[1]
return model
end

function insertrbxmx(file)
local objects = game:GetObjects(getcustomasset(file))
local model = objects[1]
return model
end

function onspawn(func)
	local player = getplayer()

	player.CharacterAdded:Connect(function()
		func()
	end)
end
--[[function setlicensekey(key,saveto)
	local iv = crypt.generatebytes(16) -- 16 bytes for AES
	local data = gethwid()

	local encrypted = crypt.encrypt(data, key, iv, "AES")
	setclipboard(encrypted)
	local decrypted = crypt.decrypt(encrypted, key, iv, "AES")
	writefile(saveto .. "key",key)
	writefile(saveto .. "iv",iv)
	print(key)
	print(decrypted == data) -- true
end

function getlicensekey(key,file)
	local key = readfile(file .. "key")
	local iv = readfile(file .. "iv")
	print(crypt.decrypt(gethwid(),key,iv,"AES"))
end]]

function teleportto(to)
	local char = getchar()
	local hrp = char.HumanoidRootPart
	hrp.CFrame = to.CFrame
end

goto = teleportto
getrbxmx = insertrbxmx

function dohttpscript(sc)
   loadstring(game:HttpGet(sc))()
end

function getpath(var)
  return var:GetFullName()
end

function filterstring(text, patterns)
	local result = text
	
	for i,v in ipairs(patterns) do
		result = string.gsub(result, v, "")
	end
	
	return result
end

function stringfy(data,type)
	local result
	local cf = data
	if type == "CFrame" then
		result = string.format("CFrame.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "Vector3" then
		result = string.format("Vector3.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "Color3" then
		result = string.format("Vector3.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "table" then
		local t = {}
		for k,v in pairs(data) do
			t[#t+1] = "["..k.."]="..tostring(v)
		end
		result = "{"..table.concat(t,",").."}"
	else
		result = tostring(data)
	end
	return result
end

function serialize(data,type)
	local result
	local cf = data
	if type == "CFrame" then
		result = string.format("CFrame.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "Vector3" then
		result = string.format("Vector3.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "Color3" then
		result = string.format("Vector3.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
	elseif type == "table" then
		local t = {}
		for k,v in pairs(data) do
			t[#t+1] = "["..k.."]="..tostring(v)
		end
		result = "{"..table.concat(t,",").."}"
	else
		result = tostring(data)
	end
	return result
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
			Headers = {["Content-type"] = "application/json"},
			Body = json or JSONEncode(json)
		})
end
if not getgenv().LDXREPOSITORYSTORAGE then
	local newidname = crypt.encrypt(uid(true) .. uid(true),"LIUDEX","AES","CBC")
	local ReplicatedIdSet = Instance.new("Folder")
	ReplicatedIdSet.Parent = gethui()
	ReplicatedIdSet.Name = newidname
	getgenv().LDXREPOSITORYSTORAGE = ReplicatedIdSet
end

function getldxstorage()
   return getgenv().LDXREPOSITORYSTORAGE
end

function backnormal()
    task.wait(0.2)
    local errorprompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay
    local prompterror = errorprompt.ErrorPrompt
    errorprompt.BackgroundColor3 = olderrOverlaybackground
    prompterror.BackgroundColor3 = olderrPromptbackground
    task.wait()
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

function ex:ForceClose()
	game:Shutdown()
end

function ex:FC()
	game:Shutdown()
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

function liudex:Announcement(title,message)
	local tp = game:GetService("TeleportService") 
    local player = game:GetService("Players").LocalPlayer 
    tp:TeleportToPlaceInstance(game.PlaceId,"4211561", player)
    task.wait(0.28)
    --prompt data
    local errorprompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay
    local prompterror = errorprompt.ErrorPrompt
    local BtnText= prompterror.MessageArea.ErrorFrame.ButtonArea.OkButton.ButtonText
    local okbutton = prompterror.MessageArea.ErrorFrame.ButtonArea.OkButton
    local Message = prompterror.MessageArea.ErrorFrame.ErrorMessage
    local Title =prompterror.TitleFrame.ErrorTitle
    errorprompt.BackgroundColor3 = newerrOverlaybackground
    prompterror.BackgroundColor3 = newerrPromptbackground
    task.wait()
    Title.Text = title
    Message.Text = message
    okbutton.ImageColor3 = newerrButtonColor
    okbutton.ButtonText.TextColor3 = olderrButtonColor
    okbutton.MouseButton1Click:Connect(function()
    backnormal()
end

function liudex:RequestNgrok(uri)
    local response = request({
    Url = uri,
    Method = "GET",
    Headers = {
        ["ngrok-skip-browser-warning"] = "true"
    }
    })
    return response.Body
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
getgenv().ex = ex
getgenv().liudex = liudex

return {
	ex = ex,
    liudex = liudex
}
