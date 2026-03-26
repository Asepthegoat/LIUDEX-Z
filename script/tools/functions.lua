getgenv().ldxAttachedNotify = true
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

function generatevarchar(length)
	local chars = "abcdefghijklmnopqrstuvwxyz♪♦♥♠♣§£¢€¥ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:,.<>/?†‡★·±\∆•|~μΠΩ√÷×¶←↑↓→°∞≠≈✓àâåæãáääßöō"
	local result = ""

	for i = 1, length do
		local rand = math.random(1, #chars)
		result = result .. chars:sub(rand, rand)
	end

	return result
end

function postjson(uri,json)
	request({
			Url = uri,
			Method = "POST",
			Headers = {["Content-type"] = "application/json"},
			Body = json or JSONEncode(json)
		})
end
local script 
if not getgenv().LDXREPOSITORYSTORAGE then --making repository
	local newidname = generatevarchar(100)
	local ReplicatedIdSet = Instance.new("Folder")
	ReplicatedIdSet.Parent = gethui()
	ReplicatedIdSet.Name = newidname
  local script = Instance.new("LocalScript")
  script.Name = "String"
  script.Parent = ReplicatedIdSet
  script.Source = ""
	getgenv().LDXREPOSITORYSTORAGE = ReplicatedIdSet
end

function getldxstorage()
   return getgenv().LDXREPOSITORYSTORAGE
end

local function backnormal()
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

function ex:getallfunction(targetfunc,detail,waits,runf,...)
  local tablef = {}
  if targetfunc == "" or not targetfunc then
    table.insert(tablef,v)
    for i,v in pairs(getgc()) do
      print(i,"Source: ",debug.info(v,"s"),"\nName: ", debug.info(v,"n"),"\nFunc: ",debug.info(v,"f"))
      task.wait(waits)
    end
  else
    for i,v in pairs(getgc()) do
      local deb = debug.info(v,"n")
      local info = debug.getinfo(v)
      if deb:match(targetfunc) then
        table.insert(tablef,v)
        if detail then
          print("Source: ",debug.info(v,"s"),"\nName: ", info.name,"\nFunc: ",info.func,"\nType",info.what,"\nCurrentLine: ",info.currentlinem,"\n")
        end
        if runf then
          v(...)
        end
      end
    end
  end
  return tablef
end

function ex:getspecificfunction(target,detail,runf,...)
  for i,v in next, getgc() do
    local info = debug.getinfo(v)
    
    if debug.info(v,"n") == target then
      if detail then
        print("Source: ",debug.info(v,"s"),"\nName: ", info.name,"\nFunc: ",info.func,"\nType",info.what,"\nCurrentLine: ",info.currentlinem,"\n")
      end
      if runf then
        v(...)
      end
    elseif v == target then
      if detail then
        print("Source: ",debug.info(v,"s"),"\nName: ", info.name,"\nFunc: ",info.func,"\nType",info.what,"\nCurrentLine: ",info.currentlinem,"\n")
      end
      if runf then
        v(...)
      end
    end
  end
end

ex.FindFunction = ex.getspecificfunction

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

--prompt stuff
local function corner(parent)
  local corners = Instance.new("UICorner")
  corners.CornerRadius = UDim.new(0,10)
  corners.Parent = parent
end

local function layout(par,pad)
    local s = Instance.new("UIListLayout")
    s.Parent = par
    s.SortOrder = Enum.SortOrder.LayoutOrder
    s.FillDirection = Enum.FillDirection.Vertical
    s.HorizontalAlignment = Enum.HorizontalAlignment.Center
    s.VerticalAlignment = Enum.VerticalAlignment.Top
    s.Padding = UDim.new(0,pad)
end

local function border(name,color,thickness,parrent)
	local border = Instance.new("UIStroke")
	border.Parent = parrent
	border.Name = name
	border.Color = color
	border.Thickness = thickness
	return border
end

local function padding(par,top,bot,left,rig)
    local b = Instance.new("UIPadding")
    b.Parent = par
    b.PaddingBottom = UDim.new(bot,0)
    b.PaddingTop = UDim.new(top,0)
    b.PaddingLeft = UDim.new(left,0)
    b.PaddingRight = UDim.new(rig,0)
end

function prompt(num,callback,tbl)
    local s = Instance.new("ScreenGui")
    s.Parent = getldxstorage()
    s.Name = "LDXPrompt"
    if num == 1 then
        local base = Instance.new("Frame",s)
        base.Size = UDim2.new(0,250,0,330)
        base.Position = UDim2.new(0.5,-125,0.5,-190)
        base.BackgroundColor3 = Color3.fromRGB(15,0,45)
        corner(base)

        local close = Instance.new("TextButton",base)
        close.Size = UDim2.new(0,35,0,35)
        close.Position = UDim2.new(1,-45,0,5)
        close.BackgroundTransparency = 1
        close.Text = "X"
        close.TextSize = 17
        close.TextColor3 = Color3.new(0.5,0.5,0.5)
        corner(close)

        close.MouseButton1Click:Connect(function()
            s:Destroy()
        end)

        -- holder untuk auto layout
        local holder = Instance.new("Frame",base)
        holder.Size = UDim2.new(0.9,0,0.7,0)
        holder.Position = UDim2.new(0.05,0,0.08,0)
        holder.BackgroundTransparency = 1

        layout(holder,5)

        local Imagec = Instance.new("ImageLabel",holder)
        Imagec.Size = UDim2.new(0.55,0,0.55,0)
        Imagec.Image = tbl.logo or "rbxassetid://126569944133822"
        Imagec.BackgroundTransparency = 1
        corner(Imagec)

        local holder2 = Instance.new("Frame",holder)
        holder2.Size = UDim2.new(0.9,0,0.7,0)
        holder2.Position = UDim2.new(0.05,0,0.08,0)
        holder2.BackgroundTransparency = 1
        layout(holder2,1)

        local text = Instance.new("TextLabel",holder2)
        text.Size = UDim2.new(1,0,0,30)
        text.RichText = true
        text.Text = "<b>Join "..tbl.title.." Community Now</b>"
        text.TextColor3 = Color3.new(1,1,1)
        text.TextScaled = true
        text.BackgroundTransparency = 1
        text.TextXAlignment = Enum.TextXAlignment.Left

        local text2 = Instance.new("TextLabel",holder2)
        text2.Size = UDim2.new(1,0,0,10)
        text2.RichText = true
        text2.Text = tbl.desc
        text2.TextXAlignment = Enum.TextXAlignment.Left
        text2.TextColor3 = Color3.new(1,1,1)
        text2.TextScaled = true
        text2.BackgroundTransparency = 1
        padding(text2,0,0,0.01,0)

        local space = Instance.new("TextLabel",holder2)
        space.Size = UDim2.new(1,0,0,5)
        space.Text = ""
        space.BackgroundTransparency = 1

        local text3 = Instance.new("TextLabel",holder2)
        text3.Size = UDim2.new(1,0,0,12)
        text3.RichText = true
        text3.Text = "By " .. tbl.founder
        text3.TextXAlignment = Enum.TextXAlignment.Left
        text3.TextColor3 = Color3.new(0.4,0.4,0.4)
        text3.TextScaled = true
        text3.BackgroundTransparency = 1
        padding(text3,0,0,0.01,0)
        border("S",Color3.fromRGB(45,0,160),1,Imagec)

        local Accept = Instance.new("TextButton",base)
        Accept.Size = UDim2.new(0.9,0,0,40)
        Accept.Position = UDim2.new(0.05,0,0.95,-40)
        Accept.Text = "<b><font color='rgb(255,255,255)'>Join Community</font></b>"
        Accept.RichText = true
        Accept.TextSize = 9
        Accept.BackgroundColor3 = Color3.fromRGB(68, 0, 234)
        corner(Accept)
        Imagec.LayoutOrder = 1
        holder2.LayoutOrder = 2
        Accept.MouseButton1Click:Connect(function()
            callback()
            task.wait()
            liudex:Notify(tbl.title,"Link copied place it on your browser to join",tbl.logo,"Close")
            s:Destroy()
        end)
    elseif num == 2 then
        local base = Instance.new("Frame",s)
        base.Size = UDim2.new(0,330,0,200)
        base.Position = UDim2.new(0.5,-160,0.5,-120)
        base.BackgroundColor3 = Color3.fromRGB(15,0,45)
        corner(base)
        layout(base,5)
        local box = Instance.new("TextBox", parent)
        box.Size = UDim2.new(1,0,0,30)

        local controls = require(getplayer().PlayerScripts:WaitForChild("PlayerModule")):GetControls()
        controls:Disable()

        box:CaptureFocus()
        local Overlay = Instance.new("Frame",s)
        Overlay.Size = UDim2.new(2,0,2,0)
        Overlay.Position = UDim2.new(-1,0,-1,0)
        Overlay.BackgroundColor3 = Color3.fromRGB(15,0,45)
        Overlay.BackgroundTransparency = 0.5
        Overlay.Active = true
        Overlay.ZIndex = -1

        -- holder untuk auto layout
        local holder = Instance.new("Frame",base)
        holder.Size = UDim2.new(0.9,0,0.2,0)
        holder.Position = UDim2.new(0.05,0,0.08,0)
        holder.BackgroundTransparency = 1

        local holder2 = Instance.new("Frame",base)
        holder2.Size = UDim2.new(0.9,0,0.4,0)
        holder2.Position = UDim2.new(0.05,0,0.08,0)
        holder2.BackgroundTransparency = 1

        local holder3 = Instance.new("Frame",base)
        holder3.Size = UDim2.new(0.9,0,0.02,0)
        holder3.BackgroundTransparency = 1

        local close = Instance.new("TextButton",holder)
        close.Size = UDim2.new(0,35,0,35)
        close.Position = UDim2.new(1,-20,0,5)
        close.BackgroundTransparency = 1
        close.Text = "X"
        close.TextSize = 17
        close.TextColor3 = Color3.new(0.9,0.9,0.9)
        corner(close)

        close.MouseButton1Click:Connect(function()
            controls:Enable()
            s:Destroy()
        end)

        local Imagec = Instance.new("ImageLabel",holder2)
        Imagec.Size = UDim2.new(0,55,0,55)
        Imagec.Position = UDim2.new(0.01,0,0,0)
        Imagec.Image = tbl.logo or "rbxassetid://126569944133822"
        Imagec.BackgroundTransparency = 1
        corner(Imagec)
        border("Storke",Color3.fromRGB(45,0,160),1,Imagec)

        local text = Instance.new("TextLabel",holder)
        text.Size = UDim2.new(0.9,0,0,15)
        text.RichText = true
        text.Position = UDim2.new(0,0,0,14)
        text.Text = "<b>"..tbl.title.."</b>"
        text.TextColor3 = Color3.new(1,1,1)
        text.TextScaled = true
        text.BackgroundTransparency = 1
        text.TextXAlignment = Enum.TextXAlignment.Left

        local text2 = Instance.new("TextLabel",holder2)
        text2.Size = UDim2.new(0.8,0,0,40)
        text2.RichText = true
        text2.Position = UDim2.new(0.2,10,0,6)
        text2.Text = "<b>" .. tbl.desc .. "</b>"
        text2.TextColor3 = Color3.new(1,1,1)
        text2.TextScaled = false
        text2.TextWrapped = true
        text2.BackgroundTransparency = 1
        text2.TextXAlignment = Enum.TextXAlignment.Left
        text2.TextYAlignment = Enum.TextYAlignment.Top
            
        local Accept = Instance.new("TextButton",base)
        Accept.Size = UDim2.new(0.9,0,0,34)
        Accept.Position = UDim2.new(0.05,0,0.95,-40)
        Accept.Text = "<b><font color='rgb(255,255,255)'>" .. tbl.button .. "</font></b>"
        Accept.RichText = true
        Accept.TextSize = 9
        Accept.BackgroundColor3 = Color3.fromRGB(68, 0, 234)
        corner(Accept)
        Imagec.LayoutOrder = 1
        
        Accept.MouseButton1Click:Connect(function()
            controls:Enable()
            callback()
            task.wait()
            liudex:Notify(tbl.title,"Link copied place it on your browser to join",tbl.logo,"Close")
            s:Destroy()
        end)
        local text3 = Instance.new("TextLabel",base)
        text3.Size = UDim2.new(0.8,0,0,10)
        text3.RichText = true
        text3.Position = UDim2.new(0.2,10,0,6)
        text3.Text = tbl.founder
        text3.TextColor3 = Color3.new(1,1,1)
        text3.TextScaled = true
        text3.BackgroundTransparency = 1
        text3.TextXAlignment = Enum.TextXAlignment.Center
    end
    return s
end

function joinCommunity(tab)
    prompt(1,function() setclipboard(tab.url) end,tab)
end

function getPrompt(tab)
    prompt(2,function() setclipboard(tab.url) end,tab)
end

function liudex:RunScript(script,line)
  if line and line ~= "" then
    local var = string.split(script.Source,"\n")
    loadstring(var[line])()
  else
    loadstring(script.Source)()
  end
end

local delayannounce = 0.1
function liudex:Announcement(title,message)
	local tp = game:GetService("TeleportService") 
    local player = getplayer()
    tp:TeleportToPlaceInstance(game.PlaceId,"421151", player)
    task.wait(delayannounce)
    --prompt data
    local errorprompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay
    repeat
      task.wait(0.01)
    until errorprompt:FindFirstChild("ErrorPrompt")
    local prompterror = errorprompt:WaitForChild("ErrorPrompt")
    repeat
      task.wait(0.01)
    until prompterror.MessageArea.ErrorFrame.ButtonArea:FindFirstChild("OkButton")
    local okbutton = prompterror.MessageArea.ErrorFrame.ButtonArea:WaitForChild("OkButton")
    local BtnText = prompterror.MessageArea.ErrorFrame.ButtonArea.OkButton.ButtonText
    local Message = prompterror.MessageArea.ErrorFrame.ErrorMessage
    local Title =prompterror.TitleFrame.ErrorTitle
    errorprompt.BackgroundColor3 = newerrOverlaybackground
    prompterror.BackgroundColor3 = newerrPromptbackground
    task.wait()
    okbutton.ImageColor3 = newerrButtonColor
    okbutton.ButtonText.TextColor3 = olderrButtonColor
    delayannounce = 0.1
    if prompterror.BackgroundColor3 == newerrPromptbackground then
      errorprompt.BackgroundColor3 = newerrOverlaybackground
      prompterror.BackgroundColor3 = newerrPromptbackground
      okbutton.ImageColor3 = newerrButtonColor
      okbutton.ButtonText.TextColor3 = olderrButtonColor
    end
    task.wait(0.15)
	Title.Text = title or "LIUDEX Announcement"
    Message.Text = message or ""
    okbutton.MouseButton1Click:Connect(function()
    backnormal()
    end)
end

liudex.Announce = liudex.Announcement

function closeremoteevent(remote)
  local rem
  rem = hookmetamethod(remote,"__namecall",function(self,...)
    local method = getnamecallmethod()
    if method == "Fire" or method == "FireServer" or method == "InvokeServer" or method == "Invoke" then
      return task.wait(9e9) --yield wait
    else
      return rem(self,...)
    end
  end)
end

function closeremotefunction(remote)
  local event = remote
  
  for _, Connection in getconnections(event.OnClientEvent) do
	  local old; old = hookfunction(Connection.Function, function(...)
		  return task.wait(9e9)
	  end)
  end
end

function disconnect_all_signal(sig)
    for _, conn in ipairs(getconnections(sig)) do
        conn:Disconnect()
    end
end

function liudex:StopGame(value)
    liudex:Announcement("LIUDEX","Stopping Game")
    if value == "Safe" then --safe but kinda laggy if your console Active
      getplayer():Remove()
	  liudex:Announcement("LIUDEX","Success Secure Player")
    else
      getplayer():Kick()
    end
	liudex:Announcement("LIUDEX","Game Stopped")
    for i,v in ipairs(game.Workspace:GetDescendants()) do
      if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
        task.spawn(function()
          closeremetefunction(v)
        end)
        task.spawn(function()
          closeremoteevent(v)
        end)
      end
    end
	liudex:Announcement("LIUDEX","Game Stopped")
	disconnect_all_signal(game:GetService("ScriptContext").Error) -- stop report error
    disconnect_all_signal(getplayer().Character.Humanoid.Changed) --stop send Changed signal
    disconnect_all_signal(getplayer().Character.HumanoidRootPart.Changed)
    disconnect_all_signal(getchar().Humanoid.ChildAdded) -- stop send ChildAdded sig
    disconnect_all_signal(getchar().HumanoidRootPart.ChildAdded)
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

getgenv().LDXSignal = LDXSignal 
getgenv().ex = ex
getgenv().liudex = liudex
getgenv().ldx = liudex
local ldxfenv = {"uid","generatevarchar","run_on_func","run_on_method","insertasset","insertrbxmx","getchar","getplayer","getldxstorage","dohttpscript","prompt","joinCommunity","getPrompt","closeremotefunction","closeremoteevent"} --regist to genv
for g,j in ipairs(ldxfenv) do
    getgenv()[j] = getfenv()[j]
end

task.wait()
if not getgenv().ldxAttachedNotify then
    liudex:Announcement("LIUDEX","ldxfenv attached")
end
