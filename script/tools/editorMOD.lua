local fcolor = Color3.fromRGB(0,0,0)
local bcolor = Color3.fromRGB(40,40,40)
local fontColor = Color3.fromRGB(255,255,255)
local r = Instance.new("ScreenGui")
r.Parent = gethui()
r.Name = "Texxxz"
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.25,0,0,250)
frame.Parent = r
frame.Position = UDim2.new(0.371,0,0.5,-190)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,28,0,28)
close.Position = UDim2.new(1,-28,0,-2)
close.TextScaled = true
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255,0,0)
close.MouseButton1Click:Connect(function()
    r:Destroy()
end)

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.9,0,0,60)
input.Parent = frame
input.Position = UDim2.new(0.05,0,0,30)
input.BackgroundColor3 = Color3.fromRGB(0,0,0)
input.Text = ""
input.TextColor3 = fontColor
input.PlaceholderText = "Logo URL"
input.BackgroundColor3 = bcolor
input.PlaceholderColor3 = fontColor

local input1 = Instance.new("TextBox")
input1.Size = UDim2.new(0.9,0,0,60)
input1.Parent = frame
input1.TextColor3 = fontColor
input1.Text = ""
input1.Position = UDim2.new(0.05,0,0,100)
input1.BackgroundColor3 = Color3.fromRGB(0,0,0)
input1.PlaceholderText = "Background URL"
input1.BackgroundColor3 = bcolor
input1.PlaceholderColor3 = fontColor

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.9,0,0,60)
submit.Parent = frame
submit.Text = "Edit"
submit.Position = UDim2.new(0.05,0,0,170)
submit.BackgroundColor3 = bcolor
submit.TextColor3 = fontColor
submit.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        local logo = game:HttpGet(input.Text)
        writefile("new_logo.png",logo)
    end
    if input1.Text ~= "" then
        local background = game:HttpGet(input1.Text)
        writefile("background.png",background)
    end
end)
