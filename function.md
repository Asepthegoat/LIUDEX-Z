# function 

---

## run_on_func
```lua
run_on_func(target_function, function): void
```

This will run your function when the specified function is called.

---
### Example
```lua
local function foo()
   print("Lorem Ipsum")
end

local function boo()
   print("dolor sit amet")
end

run_on_func(foo,boo()) -- boo will run after foo called 
```
## run_on_method
```lua
run_on_method(method:string, function): void
```

This will run your function when the specified method is called.

---
### Example
```lua
local function foo()
   print("Lorem Ipsum")
end
run_on_method("HttpGet",foo())
```

## insertasset(assetid)
```lua
insertasset(assetid): instance 
```

this will return the object as an instance from assetid

---
### Example
```lua
local model = insertasset("rbxassetid://1234567890")
model.Parent = workspace
```

## inserrbxmx()
```lua
inserrbxmx(file:path): instance
```

this will return the object as an instance from your rbxmx file

---
### Example
```lua
local model = insertasset("owo.rbxmx")
model.Parent = workspace
```

## uid
```lua
uid(boolean)
```

this function used to create uid and return it to your variable 

---
### Example
```lua
local a = uid(true): string
local b = uid()
print(a) -- output xxxxxxxxxxxxxxxxxxxxx
print(b) --- output xxxx-xxxxxxx-xxxxxx-xxxxx
```

## getldxstorage()

```lua
getldxstorage(): instace
```

this function used to accessing ldx storage. usefull to place an instace here

---
### Example
```lua
local wallet = getLDXstorage():FindFirstChild("My Wallet")
```

## dohttpscript(url)

```lua
loadhttpscript(string): void
```

this function will do loadstring on your script from the url

---
### Example
```lua
loadhttpscript("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/loadscript.lua") --the script will runing now its similar to loadstring(game:HttpGet(URL))()
```
## setoffline()
```lua
setoffline(): void
```

This will make your game offline and will separate you from server.

---
### Example
```lua
if not isoffline() then
setoffline()
end 
clonechar() --you need me char to move because all script from player script and character script will disabled or removed
```
## clonechar()
```lua
clonechar(): instance
```

This function used to make new character that run in client side only

---
### Example
```lua
if not isoffline() then
setoffline()
end 
clonechar() --you need me char to move because all script from player script and character script will disabled or removed
```
## setclientid()
```lua
setclientid(newid): string
```

This function used to spoof RbxAnalyticsService:GetClientId() getclientid which is usually used to ban client

---
### Example
```lua
local newid = setclientid(uid())
print(newid)
```
## gototarget(instance,bool,int)
```lua
gototarget(target,tween,time): void
```

This function can be use to go to some part or mesh part or something else that has cframe

---
### Example
```lua
gototarget(Part, false)
```
## download(string,string)
```lua
download(filename,url): void
```

This function used to spoof RbxAnalyticsService:GetClientId() getclientid which is usually used to ban client

---
### Example
```lua
download("mylove.png", "https://static.wikia.nocookie.net/mutsuki-face/images/f/fd/Clorinde.png/revision/latest/scale-to-width-down/250?cb=20240825055321")
```
## getclientid()
```lua
getclientid(): string
```

Basically it's just a RbxAnalyticsService:GetClientId()

---
### Example
```lua
print(getclientid())
```
## safecall()
```lua
safecall(): string
```

Basically used to spoof debug.info

---
### Example
```lua
function foo()
return
end
safecall(foo)
print(debug.info(foo,"s")
```
