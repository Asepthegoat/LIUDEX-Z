local getgenv = getgenv or shared or _G
local point = 0
if not firesignal or not replicatesignal or not getgenv().replicatesignal or not getgenv().firesignal then
  --fireproximity prompt
  if not fireproximityprompt or getgenv().fireproximityprompt then
    getgenv().fireproximityprompt = function(prompt,num)
      local number = num or 0
      task.wait(number)
    replicatesignal(prompt.Triggered, game.Players.LocalPlayer)
  end

if not firetouchinterest or getgenv().firetouchinterest then
  getgenv().firetouchinterest = function(part,touch)
    firesignal(part.Touched, touch)
  end
end
    point = point + 2
end
  
end

--hook function
if not hookfunction or not getgenv().hookfunction then
  getgenv().hookfunction = function(funcname, newfunc) -- function must string
    local env = getfenv(2)
    local old = env[funcname]

    env[funcname] = function(...)
        return newfunc(old, ...)
    end
    return old
end
point = point + 1
end

local VIM = game:GetService("VirtualInputManager")
if not getgenv().keypress then
getgenv().keypress = function(key) --we can use enum for all keypress not only VICode
    VIM:SendKeyEvent(true,key,false,game)
end
point = point + 1
end
if not getgenv().keyrelease then
getgenv().keyrelease = function(key)
    VIM:SendKeyEvent(false,key,false,game)
end
point = point + 1
end
if not getgenv().keyclick then
getgenv().keyclick = function(key)
    VIM:SendKeyEvent(true,key,false,game)
    task.wait()
    VIM:SendKeyEvent(false,key,false,game)
end
  point = point + 1
end
if not getgenv().mouse1press then
getgenv().mouse1press = function(x,y)
    VIM:SendMouseButtonEvent(x,y,1,true,game)
end
  point = point + 1
end
if not getgenv().mouse1release then  
getgenv().mouse1release = function(x,y)
    VIM:SendMouseButtonEvent(x,y,1,false,game)
end
  point = point + 1
end
if not getgenv().mouse1click then
getgenv.mouse1click = function(x,y)
    VIM:SendMouseButtonEvent(x,y,1,true,game)
    task.wait()
    VIM:SendMouseButtonEvent(x,y,1,false,game)
end
  point = point + 1
end
  
if not  hookmetemethod or not getgenv().hookmetamethod then
getgenv().hookmetamethod = function(instance,type,func)
  local mt = getrawmetatable(instance)
  local readonly = isreadonly(mt)
  setreadonly(mt,false)

  local old = mt[type]
  if type ~= "" then
    old = mt[type]
    mt[type] = function(self,...)
      return func(self,...)
    end
  else
    warn("attempt to index nil with type, unknown type please enter type __index or __newindex or __namecall")
  end
  setreadonly(mt,readonly)
  return old
end
  point = point + 1
end
if not debug.setinfo then
setreadonly(debug, false)
debug.setinfo = function (func, setinfo)
    local old
    old = hookfunction(debug.info, function(selffunc, args)
        if selffunc == func then
            local newinfo = {}
            if typeof(args) == "string" then
                for i = 1, #args do
                    local v = args:sub(i,i)
                    if v == "n" then
                        table.insert(newinfo, setinfo.Name)
                    elseif v == "s" then
                        table.insert(newinfo, setinfo.Source)
                    elseif v == "l" then
                        table.insert(newinfo, setinfo.Line)
                    elseif v == "f" then
                        table.insert(newinfo, setinfo.Function)
                    end
                end
            end
            return table.unpack(newinfo)
        end
        return old(selffunc, args)
    end)
end
setreadonly(debug, true)
  point = point + 1
end
print("succes added UNC:",point)
