local HttpService = game:GetService("HttpService")
if not isfile("LIUDEX Z/Data/data.json") then
  local write = {
    ["Executor"] = tostring(identifyexecutor()),
    ["Executed Time"] = 0,
    ["Last Used"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    ["List HWID"] = {gethwid()},
    ["HWID"] = gethwid()
  }
   writefile("LIUDEX Z/Data/data.json", HttpService:JSONEncode(write))
   repeat
   until isfile("LIUDEX Z/Data/data.json")
end
local webhook = getgenv().LDXWebHookData or "https://discord.com/api/webhooks/1437697942348759133/523gFSIghjwo8JYvJ1JHG3hpa4tW-E4EJ1F8lxAhX13aFqP_98kLjggjoauCCT65tFf8"
local userdata = HttpService:JSONDecode(readfile("LIUDEX Z/Data/data.json"))
local player = game:GetService("Players").LocalPlayer
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local newhwid = true
local totalExecute = userdata["Executed Time"] + 1

local data = userdata
for i,v in ipairs(data["List HWID"]) do
  if v == gethwid() then
    newhwid = false
    break
  end
end
data["Executed Time"] = data["Executed Time"] + 1
if newhwid then 
  table.insert(data["List HWID"],gethwid())
end
local function getthumnail(id)
  local urls = HttpService:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. id .. "&size=150x150&format=Png&isCircular=false"))
  local image = urls.data[1].imageUrl
  print(image)
  return image
end

local function getplacedata(id)
  local HttpService = game:GetService("HttpService")


  local universeData = game:HttpGet("https://apis.roblox.com/universes/v1/places/".. id .."/universe")
  local universe = HttpService:JSONDecode(universeData)

  local universeId = universe.universeId

  local gameData = game:HttpGet("https://games.roblox.com/v1/games?universeIds="..universeId)
  local decoded = HttpService:JSONDecode(gameData)

  return decoded
end

local function rejoin(msg)
queue_on_teleport()
local TeleportService = game:GetService("TeleportService")

local player = game.Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("ImageLabel")
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundTransparency = 1
frame.Image = "rbxassetid://126569944133822"
frame.ScaleType = Enum.ScaleType.Stretch
frame.Parent = screenGui

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1,0,1,0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(1,1,1)
text.Text = msg or "Rejoin..."
text.TextScaled = true
text.Parent = frame

TeleportService:SetTeleportGui(screenGui)
TeleportService:Teleport(game.PlaceId, player)
end
task.wait()
writefile("LIUDEX Z/Data/data.json",HttpService:JSONEncode(data))
-- join
local joinEmbeds = {
  ["content"] = "",
  ["embeds"] = {
    {
      ["id"] = 358001787,
      ["description"] = "Don't forget to join our Discord server:\nhttps://discord.gg/WmsssRkgd2",
      ["fields"] = {
      {
        name = "Name",
        value = player.Name,
        inline = true
      },
      {
        name = "Executor",
        value = data.Executor,
        inline = true
      },
      {
        name = "Executed",
        value = data["Executed Time"],
        inline = true
      },
      {
        name = "Place",
        value = "```" .. game.PlaceId .. "```",
        inline = true
      },
      {
        name = "Playing",
        value = "```" .. getplacedata(game.PlaceId).data[1].name .. "```",
        inline = true
      },
      {
        name = "JobId",
        value = "```" .. game.JobId .. "```",
        inline = false
      },
      {
        name = "Current HWID",
        value = "```" .. data.HWID .. "```",
        inline = false
      }
    },
      ["title"] = "Profile",
      ["author"] = {
        ["name"] = player.Name
      },
      ["footer"] = {
        ["icon_url"] = "https://tr.rbxcdn.com/180DAY-768363145abfc634e1b026bdb214fbef/420/420/Image/Png/noFilter",
        ["text"] = "LIUDEX Z"
      },
      ["timestamp"] = data["Last Used"],
      ["thumbnail"] = {
        ["url"] = tostring(getthumnail(player.UserId))
      },
      ["url"] = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
      ["color"] = 3671478
    }
 },
  ["components"] = {},
  ["actions"] = {},
  ["flags"] = 0,
  ["avatar_url"] = "https://tr.rbxcdn.com/180DAY-768363145abfc634e1b026bdb214fbef/420/420/Image/Png/noFilter",
  ["username"] = "LIUDEX User Data"
}
request({
    Url = webhook,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json"},
    Body = HttpService:JSONEncode(joinEmbeds)
})
-- disconect
local sendDisconnect = false
local function Disconect(cause,reason) 
if sendDisconnect == false then
sendDisconnect = true
local DCEmbeds = {
  ["content"] = "",
  ["embeds"] = {
    {
      ["id"] = 358001787,
      ["description"] = "Don't forget to join our Discord server:\nhttps://discord.gg/WmsssRkgd2",
      ["fields"] = {
      {
        name = "Type",
        value = cause,
        inline = false
      },
      {
        name = "Reason",
        value = reason,
        inline = false
      }
    },
      ["title"] = player.Name .. " Disconect",
      ["author"] = {
        ["name"] = "Status"
      },
      ["footer"] = {
        ["icon_url"] = "https://tr.rbxcdn.com/180DAY-768363145abfc634e1b026bdb214fbef/420/420/Image/Png/noFilter",
        ["text"] = "LIUDEX Z"
      },
      ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
      ["thumbnail"] = {
        ["url"] = "https://tr.rbxcdn.com/180DAY-768363145abfc634e1b026bdb214fbef/420/420/Image/Png/noFilter"
      },
      ["url"] = "https://discord.gg/WmsssRkgd2",
      ["color"] = 3671478
    }
 },
  ["components"] = {},
  ["actions"] = {},
  ["flags"] = 0,
  ["avatar_url"] = "https://tr.rbxcdn.com/180DAY-768363145abfc634e1b026bdb214fbef/420/420/Image/Png/noFilter",
  ["username"] = "LIUDEX User Data"
}
request({
    Url = webhook,
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = HttpService:JSONEncode(DCEmbeds)
})
task.wait(1)
rejoin()
end
end
local connection
connection = CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function(child)
    task.wait(0.05)
    local errorPrompt = CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
    if errorPrompt then
        local errorMessage = errorPrompt.MessageArea.ErrorFrame.ErrorMessage
        local text = errorMessage.Text:lower()
        if string.find(text, "kicked") then
            Disconect("Kicked", errorMessage.Text)
        elseif string.find(text, "shut down") then
            Disconect("Shutdown", errorMessage.Text)
        elseif string.find(text, "idle") then
            Disconect("Idle", errorMessage.Text)
        elseif string.find(text, "lost") or string.find(text, "disconnected")  then
            Disconect("Lost Connection", errorMessage.Text)
        else
            Disconect("Unknown", errorMessage.Text)
        end

        connection:Disconnect()
    end
end)

local oldNamecall
oldNamecall = hookmetamethod(game:GetService("TeleportService"), "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
        if method == "Teleport" or method == "TeleportToPlaceInstance" then
            Disconect("Teleported", "Server shutdown or some script teleported your account")
        end
    return oldNamecall(self, ...)
end))
