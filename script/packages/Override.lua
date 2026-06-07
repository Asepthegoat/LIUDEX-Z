local write = {}
write.basicsignal = {
  "Changed","AncestryChanged","AttributeChanged","ChildAdded","ChildRemoved","DescendantAdded",
  "DescendantRemoving","Destroying","StyledPropertiesChanged","Touched","TouchEnded","NetworkOwnerChanged"
}

local getregistry
--[[
exmp filt

]]
local getinfo
getinfo = hookfunction(debug.getinfo,newcclosure(function(target,filt)
  local newinfo = {}
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
    if filt then
      for i,v in pairs(filt:split("")) do
        if v:lower() == "n" then
          newinfo[name] = target.Name
          newinfo[type] = target.className
        elseif v:lower() == "s" then
          newinfo[source] = safefullname(target)
        elseif v:lower() == "i" then
          newinfo[id] = target:GetDebugId()
        elseif v:lower() == "c" then
          newinfo[connections] = con
        elseif v:lower() == "p" then
          newinfo[properties] = getproperties(target)
        elseif v:lower() == "h" then
          newinfo[hiddenprop] = gethiddenproperties(target) or nil
          newinfo[networkowner] = isnetworkowner(target)
        end
        return newinfo
      end
    end
    return {
      name = target.name,
      type = target.className,
      connections = con,
      properties = getproperties(target),
      id = target:GetDebugId(),
      source = safefullname(target),
      hiddenprop = gethiddenproperties(target) or nil,
      networkowner = isnetworkowner(target)
    }
  elseif typeof(target):lower() == "function" then
    local info = getinfo(target)
    local suc,res = pcall(function() return getfunctionhash(target) end)
    local succ,ress = pcall(function() return debug.getconstants(target) end)
    if not suc then res = "-" end
    if not succ then ress = "-" end
    if filt then
      for i,v in pairs(filt:split("")) do
        if v:lower() == "n" then
          newinfo.name = info.name or nil
        elseif v:lower() == "s" then
          newinfo.source = info.source or nil
          newinfo.short_src = info.short_src or nil
          newinfo.linedefined = info.linedefined or nil
          newinfo.lastlinedefined = info.lastlinedefined or nil
        elseif v:lower() == "w" then
          newinfo.what = info.what or nil
        elseif v:lower() == "l" then
          newinfo.currentline = info.currentline or nil
        elseif v:lower() == "u" then
          newinfo.nups = info.nups or nil
          newinfo.numparams = info.nparams or info.numparams or nil
          newinfo.is_vararg = info.is_vararg or nil
        elseif v:lower() == "h" then
          newinfo.hash = res or nil
          newinfo.upvalues = debug.getupvalues(target) or nil
          newinfo.constants = ress or nil
        elseif v:lower() == "f" then
          newinfo.func = info.func or nil
          newinfo.ishooked = isfunctionhooked(target) or nil
        end
        return newinfo
      end
    end
    return {
      name = info.name or nil,
      source = info.source or nil,
      short_src = info.short_src or nil,
      what = info.what or nil,
      currentline = info.currentline or nil,
      linedefined = info.linedefined or nil,
      lastlinedefined = info.lastlinedefined or nil,
      nups = info.nups or nil,
      numparams = info.nparams or info.numparams or nil,
      is_vararg = info.is_vararg or nil,
      func = info.func or nil,
      constants = ress or nil,
      hash = res or nil,
      upvalues = debug.getupvalues(target) or nil,
    }
  end
  return getinfo(target)
end))
setreadonly(debug,false)

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
setreadonly(table,false) --usefull for looping table
function foreach(tbldata,func,tbl,schaduler)
  if not schadule then
    tbl.yield = 0
    tbl.delay_yield = tbl.delay_yield or 1
    tbl.yield_at = tbl.yield_at or 128
    for i,v in pairs(tbldata) do
      func(i,v)
      tbl.yield += 1
      if tbl.yield_at and tbl.yield >= tbl.yield_at then
        task.wait(tbl.delay_yield)
        tbl.yield = 0
      end
    end
  end
end
local s
s = hookfunction(table.foreach,foreach)

function table.stringfy(key,tbl)
  local strtbl = key .. "= {"
    for i,v in next,tbl do
      local strd = key .. " = "
      if typeof(tbl) == "table" then
        strd += "{" .. table.stringfy(i,v)
      end
  end
  return
end
setreadonly(table,true)
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

--prop
local custompropinst = {}
local f;f = hookmetamethod(game,"__index",newcclosure(function(self,key)
  local prop = custompropinst[self]
  if prop and prop[key] ~= nil and checkcaller() then
    return prop[key]
  end
  return f(self,key)
end))

local n;n = hookmetamethod(game,"__newindex",newcclosure(function(self,key,val)
  local prop = custompropinst[self]
  if prop and prop[key] ~= nil and checkcaller() then
    prop[key] = val
    return
  end
  return n(self,key,val)
end))

function setcustomproperties(ins,prop)
  custompropinst[ins] = prop
end

--method
local custommethod = {}
local overridemethod = {
  script = {
    ["SetReadable"] = true,
    ["Decompile"] = true,
    ["Close"] = true
  },
  actor = {
    ["Run"] = true
  },
  proximity = {
    ["Fire"] = true
  },
  touchinterest = {
    ["Fire"] = true
  }
}
local function SetReadable(ins,sourcecode)
  setcustomproperties(ins,{CompileCode = "Not compiled yet",Executor = true})
  ins.Source = ""
  ins.CompileCode = sourcecode
end

local mtmd;mtmd = hookmetamethod(game,"__namecall",newcclosure(function(self,...) --override some instance to
  local m = getnamecallmethod()
  if custommethod[self] and custommethod[self][m] and checkcaller()then
    print("true hooked")
    return custommethod[self][m](...)

  elseif self.className == "Actor" and checkcaller() and overridemethod.actor[m] then
    if m == "Run" then return run_on_actor(self,...) end

  elseif self.className == "ProximityPrompt" and checkcaller() and overridemethod.proximity[m] then
    if m == "Fire" then return fireproximityprompt(self,...) end
    
  elseif self.className == "TouchTransmitter" and checkcaller() and overridemethod.touchinterest[m] then
    if m == "Fire" then return firetouchinterest(getrootpart(),self.Parent,...) end

  elseif self.className == "ImageButton" or self.className == "TextButton" then
    if m == "Click" then return firesignal(self.MouseButton1Click) end
  elseif self.className == "LocalScript" or self.className == "Script" and checkcaller() and overridemethod.script[m] then
    if m == "Decompile" then return decompile(self) 
    elseif m == "SetReadable" then SetReadable(self,self.Source) 
    elseif m == "Dump" then return dumpsenv(script,true,true)
    elseif m == "Close" or m == "End" then
      for i,v in pairs(getreg()) do 
        if typeof(v) == "thread" then 
          local sc = getscriptfromthread(v) if sc == self then 
            coroutine.close(v) 
            break 
          end 
        end 
      end 
    end
    return true
  end

return mtmd(self,...)
end))
function setnewmethod(ins,method,func)
  if not custommethod[ins] or typeof(custommethod[ins]) ~= "table" then
    custommethod[ins] = {}
  end
  custommethod[ins][method] = func 
end

local env = getldxstorage()
local envprop = {
  className = "ReplicatedStorage",
  ClassName = "ReplicatedStorage",
  src = "GitHub"
}
setcustomproperties(env,envprop)

setnewmethod(getldxstorage(),"Import",function(path) 
  local s = insertrbxmx(path)
  s.Parent = getldxstorage()
  return s
end)

setnewmethod(getldxstorage(),"FlushCache",function(inst)
  for i,v in pairs(getldxstorage():GetDescendants()) do
    cache.invalidate(inst)
  end
end)

local olddecom;olddecom = hookfunction(decompile,newcclosure(function(sc)
  local suc,res = pcall(function() return sc.Executor end)
  if suc then
    return "-- This script is from external source and using ldx to inject it\n" .. sc.CompileCode
  end
  return olddecom(sc)
end))

liudex:Notify("LIUDEX Package","Override Attached","rbxassetid://126569944133822")
