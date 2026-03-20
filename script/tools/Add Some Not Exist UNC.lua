if not firesignal or not replicatesignal or not getgenv().replicatesignal or not getgenv().firesignal then
  print("This script didnt work because your executor didnt have firesignal or replicatedsignal")
  return
end

--hook function
if not hookfunction or not getgenv().hookfunction then
  getgenv().HOOKS = getgenv().HOOKS or {}
  getgenv().hookfunction = function(name, newf)
    local old = getgenv()[name]
    getgenv().HOOKS[name] = old
    getgenv()[name] = newf
    return old
  end
end

--fireproximity prompt
if not fireproximityprompt or getgenv().fireproximityprompt then
    getgenv().fireproximityprompt = function(prompt,num)
      local number = num or 0
      task.wait(number)
    replicatesignal(prompt.Triggered, game.Players.LocalPlayer)
  end 
end

--firetouchinterest
if not firetouchinterest or getgenv().firetouchinterest then
  getgenv().firetouchinterest = function(part,touch)
    firesignal(part.Touched, touch)
  end
end
