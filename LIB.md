# function 

---

## run_on_func
```lua
run_on_func(target_function, function)
```
This will run your function when the specified function is called.
---
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
```lua
local function foo()
   print("Lorem Ipsum")
end
run_on_method("HttpGet",foo())
```
