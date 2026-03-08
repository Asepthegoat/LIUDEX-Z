loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
local TweenService = game:GetService("TweenService")

function startTween(obj,info,goal)
   local tween = tween:Create(obj,info,goal)
   tween:Play()
end

function TweenTo(obj,Location,speed,type)
  local goal = {}
  if type == 1 then
    goal.CFrame = Location
  else
    goal.Position = Location
  end
  local time = ((obj.Position - goal.Position).Magnitude) / speed
  local tInfo = TweenInfo.new(time,Enum.EasingStyle.Linear)
  local tween = TweenService:Create(obj,speed,tInfo)
  tween:Play()
end
  
