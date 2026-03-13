
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

getgenv().Fzsdaseekdnfns = true
local background = Color3.fromRGB(40,0,70)
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
  corner.CornerRadius = UDim.new(0,10)
end
local scriptui = Instance.new("Frame")
scriptui.Size = UDim2.new(0.62,0,0.7,0)
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
input.Text = 'print("Lorem Ipsum")'
input.TextColor3 = tcolor
input.BackgroundTransparency = 1
input.BackgroundColor3 = background
input.TextWrapped = false
input.ClearTextOnFocus = false
input.ClipsDescendants = true
input.TextTruncate = Enum.TextTruncate.None
input.Font = Enum.Font.Code

local run = Instance.new("TextButton")
run.Size = UDim2.new(1,0,0,20)
run.Position = UDim2.new(0,0,1,-0.1)
run.TextColor3 = tcolor
run.BackgroundColor3 = background 
run.Text = "Execute"
run.Parent = scriptui
corner(run)
border(run)
run.BackgroundTransparency = 0
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

border(top)
makeDragParent(top)
local title = Instance.new("TextLabel")
title.Text = "LIUDEX"
title.Size = UDim2.new(0.5,0,0.5,0)
title.Position = UDim2.new(0.2,0,0.1,0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Parent = top

close.MouseButton1Click:Connect(function()
	scriptui:Destroy()
end)
local minim = false
min.MouseButton1Click:Connect(function()
	minim = not minim
	if minim then
		min.Text = "▶"
		input.Size = UDim2.new(0,0,0,0)
		scriptui.Size = UDim2.new(0.62,0,0,0)
		run.Visible = false
		run.Active = false
	else
		min.Text = "▼"
		input.Size = UDim2.new(1,-10,1,0)
		scriptui.Size = UDim2.new(0.62,0,0.7,0)
		run.Visible = true
		run.Active = true
	end
end)
run.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
loadstring(input.Text)()
end)

uis.InputBegan:Connect(function(inputt,gp)
	if gp then return end

	if uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.E) and uis:IsKeyDown(Enum.KeyCode.C) then
		local code = input.Text
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
		loadstring(code)()
	end
end)
