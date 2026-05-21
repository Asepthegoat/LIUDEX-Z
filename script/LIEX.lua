--[[

░█░░░▀█▀░█▀▀░█░█░░░█▀▀░█▀█░█▀▀░█░█░█▀▀░▀█▀      
░█░░░░█░░█▀▀░▄▀▄░░░▀▀█░█░█░█░░░█▀▄░█▀▀░░█░      
░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░      
░█▀█░█▀▄░█▀▀░█░█░█▀▀░█▀▀░▀█▀░█▀▄░█▀█░▀█▀░█▀█░█▀▄
░█░█░█▀▄░█░░░█▀█░█▀▀░▀▀█░░█░░█▀▄░█▀█░░█░░█░█░█▀▄
░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░░▀░░▀░▀░▀░▀░░▀░░▀▀▀░▀░▀

Beta 0.1
]]
if getgenv().RemoteSocket then warn("Already Exist") return end

--------------------------------------------------------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))() --LIB DON'T REMOVE THIS
local rs = import.RunService
local Players = import.Players
local HttpService = import.HttpService
--[[
work flow no nword count without skid gui
":;:" its used for invoke server
" | " its use for firesocket
"InvokeServer" used only for firing server to run code on server and didnt affected to client
or you can use POST method to invoke server
"FireSocket" used only for firing all client(reciver) to run code from sender and didnt affected annything on server

--[DISCLAIMER]--
+ may i will use json later but for now im using url encode style
+ all string gsub function format is not from me it stolen from other script or chat gpt make it
    - lets improve this to together
+ it is recommended to add a prefix to your remote name, for example ldxbring instead of just bring.
+ client Script reciever require to be same Script or Code to each other
+ you can only send string use serialize script to make your string looks like normal code and run it with  if you want
+ oprator
 - @all to fire all client that connect
 - @server to fire all client that connect and in same server(placeid and gameid) with you server
+ remote Example:
+ Socket:FireSocket(remote,target or oprator,args)
[ Developed By Lorem Ipsum Familia Developer ]

]]
getgenv().RemoteSocket = {
    MainUrl = "",
    Status = false,
    Chat = false,
    ClientId = getplayer().UserId,
    RemoteCom = {} --just make this one empty dont fill it dude
}
local TextChatService = import.TextChatService
local function fakeChat(target,msg)
    local plr = target
    local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    if plr == Players[plr.Name] then
        channel:DisplaySystemMessage('<font color="rgb(255,0,0)">' .. plr.Name .. ': </font>' .. msg)
        local ovhead = plr.Character
        TextChatService:DisplayBubble(ovhead, msg)
    else
        channel:DisplaySystemMessage('<font color="rgb(80, 47, 201)">[Server]: </font>' .. msg)
    end
end

if getgenv().RemoteSocket and getgenv().RemoteSocket.Status == true then
    return warn("Socket is already exist close it first by using:\nSocket:CloseSession()")
end

getgenv().Socket = {}

local RemoteSocket = getgenv().RemoteSocket

function Socket:SetMain(url)
    RemoteSocket.MainUrl = url
    if not RemoteSocket.Status then
        RemoteSocket.Status = true
        RemoteSocket.RemoteCom = {}
        RemoteSocket.Invoker = {}
        RemoteSocket.ClientId = getplayer().UserId
    end
end
Socket:SetMain("wss://xochitl-superexacting-unconcentrically.ngrok-free.dev")
repeat
task.wait(0.2)    
until getgenv().RemoteSocket.MainUrl ~= ""

local sockets = WebSocket.connect(RemoteSocket.MainUrl)
sockets.OnClose:Connect(function()
    warn("Session Clossed")
    sockets = WebSocket.connect()
end)
--[[
sockets.OnMessage:Connect(function(msg)
    if not RemoteSocket.Status then
        RemoteSocket.Status = true
        print("Connected")
    end
    print("recive",msg)
    if msg == "|ConnectedToSocket|" then
        return
    end
    local args = string.split(msg," | ")
    local name = args[1]
    local id = args[2]
    local op = args[3]
    local func =  RemoteSocket.RemoteCom[name].func or RemoteSocket.RemoteCom["entry"].func
    local argue = table.concat(args,",",4)
    local argument = string.split(argue,",",1)
    for i,v in pairs(argument) do
        if v:match("%$(.-)$") then
            argument[i] = findPlayer(v:match("%$(.-)$")).Name
        end
    end
    local serverdata = args[3]:split(";")
    local job = serverdata[3]
    local place = serverdata[2]
    local selfop 
    if args[1] == "invoked" then
        func = RemoteSocket.Invoker[name].func
        func(unpack(args))
    end
    if op == "@all" or op == "@global" then
        func(id,unpack(argument))
    elseif op:find("@server") then
        local serverdat = op:split(";")
        local place = serverdat[2]
        local jobid = serverdat[3]
        if tonumber(place) == game.PlaceId and jobid == game.JobId then
            func(id,unpack(argument))
        end
    elseif import.Players[op:gsub("@","")] then
        selfop = getplayer().Parent[op:gsub("@","")]
    end
    if selfop then
        if compareinstances(selfop, getplayer()) then
            func(id,unpack(argument))
        end
    end
end)
]]

sockets.OnMessage:Connect(function(msg)
    if not RemoteSocket.Status then
        RemoteSocket.Status = true
        print("Connected")
    end
    print("recive",msg)
    if msg == "|ConnectedToSocket|" then
        return
    end
    local args = HttpService:JSONDecode(msg)
    local name = args['name']
    local id = args['id']
    local op = args['opr']
    local func =  RemoteSocket.RemoteCom[name].func or RemoteSocket.RemoteCom["entry"].func
    for i,v in pairs(args.args) do
        if v:match("%$(.-)$") then
            argument[i] = findPlayer(v:match("%$(.-)$")).Name
        end
    end
    if op:lower() == "@manager" then
        return
    end
    local serverdata = args['opr']:split(";")
    local job = serverdata['opr']
    local place = serverdata[2]
    local selfop 
    if args.name == "invoked" then
        func = RemoteSocket.Invoker[name].func
        func(unpack(args.args))
    end
    if op == "@all" or op == "@global" then
        func(id,unpack(args.args))
    elseif op:find("@server") then
        local serverdat = op:split(";")
        local place = serverdat[2]
        local jobid = serverdat[3]
        if tonumber(place) == game.PlaceId and jobid == game.JobId then
            func(id,unpack(args.args))
        end
    elseif import.Players[op:gsub("@","")] then
        selfop = getplayer().Parent[op:gsub("@","")]
    end
    if selfop then
        if compareinstances(selfop, getplayer()) then
            func(id,unpack(args.args))
        end
    end
end)


function Socket:CloseSession()
    sockets:Close()
    getgenv().RemoteSocket = nil
    warn("Clossed")
end

function Socket.new(name,func)
    if name and typeof(name) == "string" then
        if not RemoteSocket.RemoteCom[name] then
            local remote = {}
            remote.Id = RemoteSocket.ClientId
            remote.Name = name
            remote.func = func
            setmetatable(remote,{__index = Socket})
            RemoteSocket.RemoteCom[name] = remote
            return RemoteSocket.RemoteCom[name]
        end
        return error(tostring(name),"is alread exist")
    end
    error("name must be string")
end

--[[
function Socket:FireSocket(op,...)
    local args = {...}
    for i,v in pairs(args) do
        if v == "@self" then
            v = getplayer().Name
        end
    end

    if op == "@server" then
        op = op .. ";" .. game.PlaceId .. ";" .. game.JobId
    elseif op == "@self" then
        op = "@" .. getplayer().Name
    elseif op:match("%$(.-)$") then
        local partial = op:match("%$(.-)$")
        op = findPlayer(partial).Name
    end
    local value = self.Name .. " | " .. tostring(self.Id) .. " | "  .. op .. " | " ..table.concat(args,",",1)
    sockets:Send(value)
end
]]

function Socket:FireSocket(op,...)
    local args = {...}
    for i,v in pairs(args) do
        if v == "@self" then
            v = getplayer().Name
        end
    end

    if op == "@server" then
        op = op .. ";" .. game.PlaceId .. ";" .. game.JobId
    elseif op == "@self" then
        op = "@" .. getplayer().Name
    elseif op:match("%$(.-)$") then
        local partial = op:match("%$(.-)$")
        op = findPlayer(partial).Name
    end
    local value = {name = self.Name,id = tostring(self.Id), opr = op, args = {unpack(args)}}
    sockets:Send(HttpService:JSONEncode(value))
end

Socket.FireServer = Socket.FireSocket

function Socket.newChannel(call)
    local name = uid()
    if name and typeof(name) == "string" then
        if not RemoteSocket.Invoker[name] then
            local remote = {}
            remote.Id = RemoteSocket.ClientId
            remote.Name = name
            remote.func = func
            setmetatable(remote,{__index = Socket})
            RemoteSocket.Invoker[name] = remote
            return RemoteSocket.Invoker[name]
        end
        return error(name .. "is alread exist")
    end
    error("name must be string")
end

getgenv().getSocketVersion = Socket.newChannel()


function Socket:InvokeServer(remote,client,...)
    local args = {...}
    local value = "Invoke" .. ":;:" .. "&" .. self.Name .. "&" .. ":;:"  .. tostring(client) .. ":;:" ..table.concat(args," ",1)
    sockets:Send(value)
end

function Socket:GetSocket(name)
    return RemoteSocket.RemoteCom[name]
end

--stetup starter socket dont remove
local say = Socket.new("say",function(...)
    print(...,"Connect to this Server")
end)

--require entry dont change annything here
getgenv().ldxcode = Socket.new("code",function(id,...) --its global so all script can use this
    local l = {...}
    local code = table.concat(l,"\n",1)
    loadstring(code)()
end)

getgenv().ldxclosegame = Socket.new("killgame",function(id,code) --its global so all script can use this
    ex:FC()
end)

local entry = Socket.new("entry",function(id,...) --do not remove this one it used to avoid double socket connection but you can change the function inside
    print(id,"Has Join this session")
end)

local attach = false
local attachkey 
local function deattachplr()
    if typeof(attachkey) == "Instance" then
        attachkey:Destroy()
    elseif attachkey ~= nil then
        attachkey:Disconnect()
    end
    attachkey = nil
    task.wait()
end

getgenv().followtarget = Socket.new("follow",function(id,type,target,attached)
    local hrp = getchar().HumanoidRootPart
    local hrp2 = Players[target].Character.HumanoidRootPart
    if attached == "true" then
        if attach then deattachplr() end
        if type == "Attach" then
            attachkey = import.RunService.Heartbeat:Connect(function()
                hrp.CFrame = hrp2.CFrame
            end)
            attach = true
        elseif type == "follow" then
            attachkey = import.RunService.Heartbeat:Connect(function()
                getchar().Humanoid:MoveTo(hrp2.Position)
            end)
            attach = true
        end
    else
        deattachplr()
    end
end)

getgenv().chat = Socket.new("chat",function(id,...) 
    local args = {...}
    local sender = Players:GetPlayerByUserId(tonumber(id)) or "Server"
    fakeChat(sender,table.concat(args," ",1))
end)

entry:FireSocket("@manager",getplayer().Name,tostring(getsessionid()))

getgenv().ldxbring = Socket.new("Bring",function(id,target)
    if Players[target].Character then
        getrootpart().CFrame = Players[target].Character.HumanoidRootPart.CFrame + Vector3.new(0,1,0) --cuz target is a string
    end
end)

getgenv().ldxrequire = Socket.new("require",function(id,target,url)
    print(id,target,url)
    loadstring(game:HttpGet(url):gsub("getplayer%(%)", 'game:GetService("Players")["' .. target .. '"]'):gsub("%.LocalPlayer", '["' .. target .. '"]'))()
end)

getgenv().ldxbringtween = Socket.new("BringTween",function(id,target,speed)
    local subjt = Players[target].Character.HumanoidRootPart
    local time = (getchar().HumanoidRootPart.Position - subjt.Position).Magnitude / tonumber(speed)
    if Players[target].Character then
        gototarget(subjt,true,time + 0.0001)
    end
end)

getgenv().ldxAnnouncement = Socket.new("Announce",function(id,...)
    local args = {...}
    ldx:Announcement("Announcement",table.concat(args," ",1))
end)

getgenv().SendWebhookData = Socket.new("SendWebhookData",function(id,...)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/user-data.lua"))()
end)

getgenv().ldxhopto = Socket.new("hopto", function(id,goal,place,jobid)
    id = tonumber(id)
    jobid = jobid or "0"
    place = tonumber(place) or 0
    local plr = Players:GetPlayerByUserId(id)
    if goal == "RequestTeleport" then
        hopto:FireSocket("@" .. plr.Name,"GoTo",tostring(game.PlaceId),game.JobId)
        return
    elseif goal == "HopAll" then
        hopto:FireSocket("@all","GoTo",tostring(game.PlaceId),game.JobId)
        return
    end
    if goal == "GoTo" and id ~= getplayer().UserId and place ~= 0 and jobid ~= "0" then
        import.TeleportService:TeleportToPlaceInstance(tonumber(place),jobid,getplayer())
    end
end)

getgenv().UpdateClient = Socket.new("UpdateClient",function(id,...)
    return nil
end)

return sockets
