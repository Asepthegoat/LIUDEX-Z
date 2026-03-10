getgenv().loadstringloop = getgenv().loadstringloop + 1 or 0

print(getgenv().loadstringloop)
if getgenv().loadstringloop >= 20 then
print("Perfect")
elseif getgenv().loadstringloop > 4 then
print("Good")
else
print("Bad")
end
task.wait()
if getgenv().loadstringloop < 20 then
loadstring(game:HttpGet())()
end
