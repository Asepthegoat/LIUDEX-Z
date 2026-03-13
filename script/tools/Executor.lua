if getgenv().Fzsdaseekdnfns then
    return
end
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
			frame.Position = UDim2.new(
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
input.TextTruncate = Enum.TextTruncate.None
input.Font = Enum.Font.Code
makeDragParent(input)
local run = Instance.new("TextButton")
run.Size = UDim2.new(1,0,0,20)
run.Position = UDim2.new(0,0,1,-20)
run.TextColor3 = tcolor
run.BackgroundColor3 = background 
run.Text = "Execute"
run.Parent = scriptui
corner(run)
border(run)
run.BackgroundTransparency = 0


run.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
loadstring(input.Text)()
end)
