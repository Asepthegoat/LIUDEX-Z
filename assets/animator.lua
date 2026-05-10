--just a basic animation script 

local script = Instance.new("LocalScript")
script.Parent = getldxstorage() or gethui()
script.Name = "Animator"
local char = getchar()
char.Humanoid.Died:Connect(function()
	task.wait(1)
	script:Destroy()
end)
local humanoid = char:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animate = char:WaitForChild("Animate")

local anims = {
	idle = animate.idle:FindFirstChildOfClass("Animation"),
	walk = animate.walk:FindFirstChildOfClass("Animation"),
	run = animate.run:FindFirstChildOfClass("Animation"),
	jump = animate.jump:FindFirstChildOfClass("Animation"),
	fall = animate.fall:FindFirstChildOfClass("Animation"),
	climb = animate.climb:FindFirstChildOfClass("Animation"),
	}
	if animate:FindFirstChild("swim") then
		anims["swim"] = animate.swim:FindFirstChildOfClass("Animation")
		anims["swimidle"] = animate.swimidle:FindFirstChildOfClass("Animation")
	end
local tracks = {}
for name, anim in pairs(anims) do
	tracks[name] = animator:LoadAnimation(anim)
	tracks[name].Looped = true
end

local current = nil

local function play(name,sync,def)
	if current ~= name then
		if current and tracks[current] then
			tracks[current]:Stop()
		end

		current = name

		if tracks[name] then
			tracks[name]:Play()
		end
	end

	if sync and tracks[name] then
		tracks[name]:AdjustSpeed(humanoid.WalkSpeed / def)
	end
end

humanoid.Running:Connect(function(speed)
	if humanoid:GetState() == Enum.HumanoidStateType.Swimming then 
        if speed > 1 then
            play("swim")
        else
            play("swimidle")
        end
        return
    end
	
	if speed > 8 then
		play("run",true,16)
	elseif speed > 1 then
		play("walk",true,7)
	else
		play("idle")
	end
end)

humanoid.StateChanged:Connect(function(_, new)
	if new == Enum.HumanoidStateType.Jumping then
		play("jump")

	elseif new == Enum.HumanoidStateType.Freefall then
		play("fall")

	elseif new == Enum.HumanoidStateType.Climbing then
		play("climb")

	elseif new == Enum.HumanoidStateType.Swimming then
		if humanoid.MoveDirection.Magnitude > 0 then
			play("swim")
		else
			play("swimidle")
		end
	end
end)

-- default
play("idle")
