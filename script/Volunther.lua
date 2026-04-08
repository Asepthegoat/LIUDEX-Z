local configs = ldx:GetService("Configuration")
local EnableRequestLog = Instance.new("BindableEvent",configs)
local EnableTrashLog = Instance.new("BindableEvent",configs)

if not isfolder("Volunther VSM") then
makefolder("Volunther VSM")
makefolder("Volunther VSM/Game")
makefolder("Volunther VSM/Universal") -- wip
makefolder("Volunther VSM/Configs")
makefolder("Volunther VSM/Asset")
end

if not isfolder("Volunther VSM/Game") then
makefolder("Volunther VSM/Game")
end

local savefolder = "Volunther VSM/Game"
getgenv().LDXGuiConfig = {
fontColor = Color3.new(1,1,1),
baseTransparency = 0.2,
buttonColor = Color3.fromRGB(150,0,10),
buttonSize = UDim2.new(0.9,0,0,40),
baseColor = Color3.fromRGB(150,0,10),
baseborder = Color3.fromRGB(150,0,10),
tabsize = UDim2.new(1,0,1,0),
icon = "rbxassetid://135954882431768"
}
local button = {
	Background = Color3.fromRGB(150,0,10),
	Radius = 10,
	Transparency = 0.3,
	Size = UDim2.new(1,0,0,35)
}
local background = getgenv().LDXGuiConfig.baseColor
function createdropdowntextonly(ui,name,table,align)
	local dropdown = gui("Frame","dropdown",background,"",ui,10,0.5)
	dropdown.Size = UDim2.new(1,0,0,30)
	local dropdownBtn = gui("TextButton","dropdown",background,name,dropdown,10,0.5)
	dropdownBtn.Size = UDim2.new(1,0,0,30)
	local totalChild = 1
	local ddopen = false
	createLayout(dropdown,5)
	for _,v in pairs(table) do
	   local btn = gui("TextLabel",v.Name,background,v.Name,dropdown,10,0.5)
	   btn.Size = UDim2.new(1,0,0,30)
	   totalChild = totalChild + 1
	   btn.Visible = false
	   btn.TextXAlignment = Enum.TextXAlignment[align]
	   btn.Active = false
	end
	dropdownBtn.MouseButton1Click:Connect(function()
		ddopen = not ddopen
		if ddopen then
			dropdown.Size = UDim2.new(1,0,0,(35 * totalChild))
		else
			dropdown.Size = UDim2.new(1,0,0,30)
		end
		for u,n in ipairs (dropdown:GetChildren()) do
			if n ~= dropdownBtn and n:IsA("TextLabel") then
				n.Visible = ddopen
				n.Active = ddopen
			end
		end
	end)
	return dropdown
end

local tabs = {"Home","Main","Info"}
if isfolder("Volunther VSM/Game/" .. game.PlaceId) then
for i,v in pairs(listfiles("Volunther VSM/Game/" .. game.PlaceId)) do
local args = string.split(v,"/")
local name = args[#args]
table.insert(tabs,name)
end
end

local function corner(par,cor)
    local f = Instance.new("UICorner",par)
    f.CornerRadius = UDim.new(0,cor)
    return f
end

local function createInput(text,fr)
    local inputs = Instance.new("TextBox")
    inputs.Size = UDim2.new(1,0,0,35)
    inputs.Parent = fr
    inputs.BackgroundColor3 = getgenv().LDXGuiConfig.buttonColor
    inputs.Text = ""
    inputs.TextColor3 = getgenv().LDXGuiConfig.fontColor
    inputs.PlaceholderText = text
    inputs.PlaceholderColor3 = getgenv().LDXGuiConfig.fontColor 
    corner(inputs,10)
    inputs.BackgroundTransparency = 0.3
    return inputs
end
local executable = {}

local suc,ref = pcall(function()
    for _,scrpt in pairs(listfiles("Volunther VSM/Game/" .. game.PlaceId)) do
        local args = string.split(scrpt,"/")
        local foldername = args[#args]
        executable[foldername] = {}
        for _,v in pairs(listfiles(scrpt)) do
            table.insert(executable[foldername], v)
        end
    end
end)
if not suc then
    makefolder("Volunther VSM/Game/" .. game.PlaceId)
end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/UI-LIB.lua"))()

local vgui = createMain(UDim2.new(0.2,0,0.1,0),0.6,0.75,tabs,true,"Volunther VSM","Developed By <font color='rgb(255,0,0)'>Veldenoire</font>")
local main = vgui.MainFrame
local icon = vgui.Icon
local panel = main.RightPanel
local tab = main.LeftPanel
local mainpanel = panel.Main
local homePanel = panel.Home
local inform = panel.Info
inform.CanvasSize = UDim2.new(0,0,0,800)
icon.Active = true
icon.Draggable = true
tab.ScrollBarImageTransparency = 1
tab.ScrollingDirection = Enum.ScrollingDirection.Y
main.Active = true
main.BackgroundColor3 = Color3.new(0.01,0.01,0.01)
main.Draggable = true

local discord = newButton(button,"Discord",homePanel,function()
local table = {
    title = "LIUDEX",
    logo = "rbxassetid://126569944133822",
    desc = "We Are Good Devs",
    founder = "Jorell",
    url = "https://discord.gg/WmsssRkgd2"
} 
joinCommunity(table)
end)
createLayout(mainpanel)
local inpt = createInput("Script Name...",mainpanel)

local tabname = createInput("Tab Name...",mainpanel)

local inpt2 = createInput("Script Code...",mainpanel)

local accept = newButton(button,"Add",mainpanel,function()
if not isfolder(savefolder .. "/" .. game.PlaceId .. "/" .. tabname.Text) then
      makefolder(savefolder .. "/" .. game.PlaceId .. "/" .. tabname.Text)
end
writefile(savefolder .. "/" .. game.PlaceId .. "/" .. tabname.Text .. "/" .. inpt.Text,inpt2.Text)
print("Created")
end)
--info
local infotable = {
{Name = "Stats"},
{Name="Place Id"},
{Name="Job Id"},
{Name="HWID"},
{Name="Client Id"},
{Name = "Country Id"},
{Name = "Session Id"},
{Name = "User Id"},
{Name = "Game"},
{Name = "Player"},
{Name = "Name"},
{Name = "Ping"},
{Name = "Executor"}
}
createdropdowntextonly(panel.Info,"Info",infotable,"Left")

--tab
for folderName, files in pairs(executable) do
    local dddata = {}
    for _,path in pairs(files) do
        local nme = string.split(path,"/")
        local filename = nme[#nme]
        table.insert(dddata,{
            Name = filename,
            Callback = function()
                dofile(path)
            end
        })
    end
    -- buat satu dropdown per folder
    local infodd = createdropdown(panel[folderName], folderName, dddata)
end

