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
