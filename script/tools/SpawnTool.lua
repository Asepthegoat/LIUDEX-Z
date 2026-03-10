local player = game.Players.LocalPlayer

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
task.wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/tools/functions.lua"))()
local model = insertrbxmx("sawit tree.rbxmx")
model.PrimaryPart = model.PlantAnchor
model.Name = "Sawit Tree"
model.Parent = getLDXstorage()
local primPart = model.PrimaryPart
local tool = Instance.new("Tool")
tool.Name = "OWO.."
tool.RequiresHandle = true
tool.CanBeDropped = false
tool.Parent = player.Backpack

local handle = Instance.new("Part")
handle.Size = Vector3.new(1, 1, 1)
handle.Anchored = false
handle.CanCollide = true
handle.Transparency = 1
handle.Name = "Handle"
handle.Parent = tool

local mouse
local force = 100
local inputConn
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")


tool.Equipped:Connect(function(m)
	mouse = m
	print("Tool dipegang!")

	inputConn = UIS.InputBegan:Connect(function(input, gp)
		-- CLICK KIRI place model
		if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			local models = getLDXstorage():FindFirstChild("Sawit Tree"):Clone()
			models.Parent = workspace
			models:PivotTo(CFrame.new(mouse.Hit.Position))
			local part = models.PrimaryPart
			part.Position = mouse.Hit.Position
			part.Size = Vector3.new(0.1,0.001,0.1)
			part.Anchored = true
			part.CanCollide = true
			part.BrickColor = BrickColor.new("Really red")
			part.Material = Enum.Material.Neon
			part.Transparency = 1
			part:SetAttribute("Additional","Vunerable")
			print("Part dibuat di posisi mouse")
		end

		if input.KeyCode == Enum.KeyCode.T then
			local target = mouse.Target
			if target and target:IsA("BasePart") or target:IsA("MeshPart") then
				local VFX = Instance.new("Explosion")
				VFX.Position = mouse.Hit.Position
				VFX.Parent = workspace
				VFX.BlastRadius = 10
				VFX.BlastPressure = 0
				VFX.DestroyJointRadiusPercent = 10
				Debris:AddItem(VFX, 5)
				print("Part dihapus:", target.Name)
				target:Destroy()
			else
				print("Tidak ada part yang di-select")
			end
		end
		if input.KeyCode == Enum.KeyCode.Y then
			local target = mouse.Target
			if target and target.Parent ~= workspace or target.Parent ~= game then
				local VFX = Instance.new("Explosion")
				VFX.Position = mouse.Hit.Position
				VFX.Parent = workspace
				VFX.BlastRadius = 10
				VFX.BlastPressure = 0
				VFX.DestroyJointRadiusPercent = 10
				Debris:AddItem(VFX, 5)
				print("Part dihapus:", target.Name)
				target.Parent:Destroy()
			else
				print("Tidak ada part yang di-select")
			end
		end
		if input.KeyCode == Enum.KeyCode.G then
			local forward = root.CFrame.LookVector -- arah depan
			local spawnPos = root.Position + forward * 0.5 + Vector3.new(0,2,0)
			local i = 0
			while i <= 10 do
				local part = Instance.new("Part")
				part.Anchored = false
				part.Position = spawnPos
				part.CanCollide = false
				part.BrickColor = BrickColor.Random()
				part.Parent = workspace
				part.CFrame = CFrame.new(spawnPos, mouse.Hit.Position)

				local bv = Instance.new("BodyVelocity")
				local direction = (mouse.Hit.Position - spawnPos).Unit 

				bv.Velocity = direction * force
				bv.MaxForce = Vector3.new(4000,4000,4000)
				bv.Parent = part
				task.spawn(function ()
					task.wait(0.1)
					part.CanCollide = true
				end)
				Debris:AddItem(bv, 0.5)

				-- Hapus part setelah 10 detik
				Debris:AddItem(part, 10)
				i = i+1
				task.wait(0.05)
			end
		end
	end)
end)

tool.Unequipped:Connect(function()
	if inputConn then
		inputConn:Disconnect()
		inputConn = nil
		print("Tool dilepas, listener dimatikan")
	end
end)
