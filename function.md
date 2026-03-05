# function 

---

## run_on_func
```lua
run_on_func(target_function, function)
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
run_on_method(method:string, function)
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
insertasset(assetid)
```

this will return the object from assetid

---
### Example
```lua
local model = insertasset("rbxassetid://1234567890")
```

## uid
```lua
uid(boolean)
```

this function used to create uid and return it to your variable 

---
### Example
```lua
local a = uid(true)
local b = uid()
print(a) -- output xxxxxxxxxxxxxxxxxxxxx
print(b) --- output xxxx-xxxxxxx-xxxxxx-xxxxx
```

## loadhttpscript(script)
```loadhttpscript(link:string)```

this function will do loadstring on your script from the url

---
### Example
```loadhttpscript("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/loadscript.lua") --the script will runing now its similar to loadstring(game:HttpGet(URL))()```
