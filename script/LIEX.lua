--[[

__| |___________________________________________________________________________________________________________________________________| |__
__   ___________________________________________________________________________________________________________________________________   __
  | |                                                                                                                                   | |  
  | |██╗     ██╗███████╗██╗  ██╗     ██████╗ ██████╗  ██████╗██╗  ██╗███████╗███████╗████████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ | |  
  | |██║     ██║██╔════╝╚██╗██╔╝    ██╔═══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗| |  
  | |██║     ██║█████╗   ╚███╔╝     ██║   ██║██████╔╝██║     ███████║█████╗  ███████╗   ██║   ██████╔╝███████║   ██║   ██║   ██║██████╔╝| |  
  | |██║     ██║██╔══╝   ██╔██╗     ██║   ██║██╔══██╗██║     ██╔══██║██╔══╝  ╚════██║   ██║   ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗| |  
  | |███████╗██║███████╗██╔╝ ██╗    ╚██████╔╝██║  ██║╚██████╗██║  ██║███████╗███████║   ██║   ██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║| |  
  | |╚══════╝╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝| |  
__| |___________________________________________________________________________________________________________________________________| |__
__   ___________________________________________________________________________________________________________________________________   __
  | |                                                                                                                                   | |  

Beta 0.1
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))() --LIB DON'T REMOVE THIS
--[[
work no nword count flow
":;:" its used for invoke server
" | " its use for firesocket
"InvokeServer" used only for firing server to run code on server and didnt affected to client
or you cant use POST method to invoke server
"FireSocket" used only for firing client to run code from server and didnt affected annything on server
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/Asset/Gui/LIEX_Control_Pannel.lua"))

local TextChatService = import.TextChatService
function fakeChat(target,msg)
    local head = target.Character.Head
    TextChatService:DisplayBubble(head, msg)
    local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    channel:DisplaySystemMessage('<font color="rgb(255,0,0)">' .. target.Name ' :</font>' .. msg)
end

if getgenv().RemoteSocket and getgenv().RemoteSocket.Status == true then
    return warn("Socket is already exist close it first by using:\nSocket:CloseSession()")
end

getgenv().RemoteSocket = {
    MainUrl = "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev",
    Status = false,
    ClientId = getplayer().UserId, --or make this into user id if you want to do botting system
    RemoteCom = {} --just make this one empty
}

getgenv().Socket = {}

local RemoteSocket = getgenv().RemoteSocket
local sockets = WebSocket.connect(RemoteSocket.MainUrl)
sockets.OnClose:Connect(function()
    print("Session Clossed")
end)

sockets.OnMessage:Connect(function(msg)
    if not RemoteSocket.Status then
        RemoteSocket.Status = true
    end
    print("recive",msg)
    local args = string.split(msg," | ")
    local name = args[1]
    local id = args[2]
    local op = args[3]
    local func =  RemoteSocket.RemoteCom[name].func
    local argue = table.concat(args,",",4)
    local argument = string.split(argue,",",1)
    local serverdata = args[3]:split(";")
    local job = serverdata[3]
    local place = serverdata[2]
    local selfop 
    if op == "@all" or op == "@global" then
        func(id,unpack(argument))
    elseif import.Players[op:gsub("@","")] then
        selfop = getplayer().Parent[op:gsub("@","")]
    elseif op == "@server" then
        
    end
    if selfop then
        if compareinstances(selfop, getplayer()) then
            func(id,unpack(argument))
        end
    end
end)

function Socket:CloseSession()
    sockets:Close()
    getgenv().RemoteSocket = nil
    print("Clossed")
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
        return error(name,"is alread exist")
    end
    error("name must be string")
end

function Socket:FireSocket(remote,op,...)
    local args = {...}
    if op == "server" then
        op = op .. ";" .. game.PlaceId .. ";" .. game.JobId
    end
    local value = remote.Name .. " | " .. tostring(remote.Id) .. " | "  .. op .. " | " ..table.concat(args," ",1)
    sockets:Send(value)
end

function Socket:InvokeServer(remote,client,...)
    local args = {...}
    local value = remote.Name .. ":;:" .. tostring(remote.Id) .. ":;:"  .. tostring(client) .. ":;:" ..table.concat(args," ",1)
    sockets:Send(value)
end

function Socket:GetSocket(name)
    return RemoteSocket.RemoteCom[name]
end

--stetup starter socket dont remove
local say = Socket.new("say",function(...)
    print(...,"Connect to this Server")
end)

local code = Socket.new("code",function(id,code,test)
    print(test)
    loadstring(code)()
end)

local chat = Socket.new("Chat",function(op,sender,...)
    local args = {...}
    fakeChat(sender,table.concat(args," ",1))
end)

--first call needed to check your connected or no because delta didnt have signal if you connect to socket
--and i dont want to use repeat
--[[
--if you want to use repeat:

repeat 
    task.wait(0.1)
until sockets
]]
Socket:FireSocket(chat,"@all","Hello everyone my name is" .. getplayer().Name)

--[[DISCLAIMER]]--
--[[
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

local bring = Socket.new("Bring",function(op,target)
    print(target)
    if import.Players[target].Character then
        getrootpart().CFrame = import.Players[target].Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0) --cuz target is a string
    end
end)
