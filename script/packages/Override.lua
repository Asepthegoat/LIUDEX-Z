local write = {}
write.basicsignal = {
  "Changed","AncestryChanged","AttributeChanged","ChildAdded","ChildRemoved","DescendantAdded",
  "DescendantRemoving","Destroying","StyledPropertiesChanged","Touched","TouchEnded","NetworkOwnerChanged"
}
--advance debug.getinfo
local getinfo
getinfo = hookfunction(debug.getinfo,newcclosure(function(target,addon)
  if typeof(target):lower() == "instance" then
    local con = {}
    for i,v in pairs(write.basicsignal) do
      local succ,fail = pcall(function()
        return target[v]
      end)
      if succ then
        con[v] = getconnections(target[v])
        if #con[v] == 0 then
          con[v] = nil
        end
      end
    end
    return {
      name = target.name,
      type = target.className,
      connections = con,
      id = target:GetDebugId(),
      source = safefullname(target),
      hiddenprop = gethiddenproperties(target) or nil,
      networkowner = isnetworkowner(target)
    }
  elseif typeof(target):lower() == "function" then
    local info = getinfo(target)
    return {
      name = info.name,
      source = info.source,
      short_src = info.short_src,
      what = info.what,
      currentline = info.currentline,
      linedefined = info.linedefined,
      lastlinedefined = info.lastlinedefined,
      nups = info.nups,
      nparams = info.nparams or info.numparams,
      is_vararg = info.is_vararg or nil,
      func = info.func,
      line = debug.info(target,"l"),
      constants = debug.getconstants(target),
      upvalues = debug.getupvalues(target),
    }
  end
  return getinfo(target)
end))
--os
setreadonly(os,false)
local vim = import.VirtualInputManager
os.countryid = newcclosure(function()
  write.prop,write.hide = gethiddenproperty(getplayer(), "CountryRegionCodeReplicate")
  return write.prop
end)

os.execute = newcclosure(function(str)
  loadstring(str)
end)

os.inputkey = newcclosure(function(str,delay,delay2)
  delay = delay or 0
  str = string.split(str,"") --os.inputkey("hello world")
  for i,v in pairs(str) do
    if delay and delay2 then
      delay = math.random(0.1,delay2)
    end 
    vim:SendKeyEvent(true,Enum.KeyCode[v],false,game)
    task.wait()
    vim:SendKeyEvent(false,Enum.KeyCode[v],false,game)
    task.wait(delay)
  end
end)

os.getclipboard = newcclosure(function ()
  return import.UserInputService:GetPasteText()
end)

os.input = newcclosure(function(enum,bool,media,x,y)
  if enum ~= Enum.UserInputType.MouseButton1 or enum ~= Enum.UserInputType.MouseButton2 or enum ~= Enum.UserInputType.MouseMovement
  or enum ~= Enum.UserInputType.MouseButton3 or enum ~= Enum.UserInputType.MouseWheel then
    vim:SendKeyEvent(bool,enum,false,media or game)
  elseif typeof(enum):lower() == "number" then
    vim:SendMouseButtonEvent(x,y,enum,bool,media)
  else
    warn("Can not input " .. enum)
  end
  task.wait()
end)

os.platform = newcclosure(function()
  return import.UserInputService:GetPlatform()
end)
setreadonly(os,true)
--string
--[[getgenv().convert = {}
function convert.hex(val,from) 
  if type(val):lower() ~= "number" then
    val = tonumber(val, from)
  end
  return string.format("%x",val) 
end

function convert.bool(val,from)
  if type(val):lower() ~= "number" then
    val = tonumber(val, from)
  end
  local t = {}
    while val > 0 do
        local rest = val % 2
        table.insert(t, 1, rest)
        val = math.floor(val / 2)
    end
    return table.concat(t)
end

function convert.oct(val,from) 
  if type(val):lower() ~= "number" then
    val = tonumber(val, from)
  end
  return string.format("%o",val) 
end

setreadonly(string,false)
string.hexchar = newcclosure(function(str) --gemini fix it :)
  str = str:gsub("%s+","")
  local hasil = ""

  for i = 1, #str, 2 do
    local dhex = string.sub(str, i, i + 1)
    local decim = tonumber(dhex, 16)

    if decim then
        local huruf = string.char(decim)
        hasil = hasil .. huruf 
    end
  end 

  return hasil 
end)]]

--advance
