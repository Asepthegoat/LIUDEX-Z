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
	idle = animate.idle:WaitForChild("Animation1"),
	walk = animate.walk:WaitForChild("WalkAnim"),
	run = animate.run:WaitForChild("RunAnim"),
	jump = animate.jump:WaitForChild("JumpAnim"),
	fall = animate.fall:WaitForChild("FallAnim"),
	climb = animate.climb:WaitForChild("ClimbAnim"),
	swim = animate.swim:WaitForChild("Swim"),
	swimidle = animate.swimidle:WaitForChild("SwimIdle"),
}

local tracks = {}
for name, anim in pairs(anims) do
	tracks[name] = animator:LoadAnimation(anim)
	tracks[name].Looped = true
end

local current = nil

local function play(name)
	if current == name then return end
	
	if current and tracks[current] then
		tracks[current]:Stop()
	end
	
	current = name
	if tracks[name] then
		tracks[name]:Play()
	end
end

humanoid.Running:Connect(function(speed)
	if humanoid:GetState() == Enum.HumanoidStateType.Swimming then return end
	
	if speed > 8 then
		play("run")
	elseif speed > 0 then
		play("walk")
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
