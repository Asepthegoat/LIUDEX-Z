

local LGui = getgenv().LDXGuiConfig

local textColor = LGui.fontColor
local frameTransparency = LGui.baseTransparency
local background = LGui.baseColor

-- DRAG
function makeDraggable(frame)
	local dragging = false
	local dragStart, startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- BASE GUI
function gui(type,name,bg,text,parent,radius,transparency)
	local ui = Instance.new(type)
	ui.Name = name
	ui.Parent = parent
	ui.BackgroundColor3 = bg
	ui.BackgroundTransparency = transparency

	if ui:IsA("TextButton") or ui:IsA("TextLabel") then
		ui.Text = text
		ui.Font = Enum.Font.SourceSansBold
		ui.TextScaled = true
		ui.TextColor3 = textColor
	end

	local corner = Instance.new("UICorner")
	corner.Parent = ui
	corner.CornerRadius = UDim.new(0,radius)

	return ui
end

-- LAYOUT
function createLayout(parent,padding)
	local layout = Instance.new("UIListLayout")
	layout.Parent = parent
	layout.Padding = UDim.new(0,padding or 10)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.VerticalAlignment = Enum.VerticalAlignment.Top
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	return layout
end

-- PADDING
function createPadding(parent,top,bottom,left,right)
	local pad = Instance.new("UIPadding")
	pad.Parent = parent
	pad.PaddingTop = UDim.new(0,top or 0)
	pad.PaddingBottom = UDim.new(0,bottom or 0)
	pad.PaddingLeft = UDim.new(0,left or 0)
	pad.PaddingRight = UDim.new(0,right or 0)
	return pad
end

-- BUTTON
function newButton(tbl,text,parent,callback)
	local btn = gui(
		"TextButton",
		text,
		tbl.Background,
		text,
		parent,
		tbl.Radius,
		tbl.Transparency
	)
	btn.TextXAlignment = tbl.AlignmentX or Enum.TextXAlignment.Center
	btn.TextYAlignment = tbl.AlignmentY or Enum.TextYAlignment.Center
	btn.Size = tbl.Size

	if callback then
		btn.MouseButton1Click:Connect(callback)
	end

	return btn
end

-- SHOW TAB
function show(frames,current)
	for _,v in ipairs(frames) do
		v.Visible = (v == current)
		v.Active = (v == current)
	end
end
function createdropdown(ui,name,table)
	local dropdown = gui("Frame","dropdown",background,"",ui,10,0.5)
	dropdown.Size = UDim2.new(1,0,0,30)
	local dropdownBtn = gui("TextButton","dropdown",background,name,dropdown,10,0.5)
	dropdownBtn.Size = UDim2.new(1,0,0,30)
	local totalChild = 1
	local ddopen = false
	createLayout(dropdown,5)
	for _,v in pairs(table) do
	   local btn = gui("TextButton",v.Name,background,v.Name,dropdown,10,0.5)
	   btn.Size = UDim2.new(1,0,0,30)
	   totalChild = totalChild + 1
	   btn.Visible = false
	   btn.Active = false
	   btn.MouseButton1Click:Connect(function()
		  if v.Callback then
		     v.Callback()
		  end
	   end)
	end
	dropdownBtn.MouseButton1Click:Connect(function()
		ddopen = not ddopen
		if ddopen then
			dropdown.Size = UDim2.new(1,0,0,(35 * totalChild))
		else
			dropdown.Size = UDim2.new(1,0,0,30)
		end
		for u,n in ipairs (dropdown:GetChildren()) do
			if n ~= dropdownBtn and n:IsA("TextButton") then
				n.Visible = ddopen
				n.Active = ddopen
			end
		end
	end)
end

-- MAIN
local tabs = {}
function createMain(pos,scaleX,scaleY,tabNames,dragable,name,descript)

	if scaleX and scaleX < 0.3 then scaleX = 0.3 end
	if scaleY and scaleY < 0.15 then scaleY = 0.15 end

	local scale = UDim2.new(scaleX or 0.4,0,scaleY or 0.5,0)

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = gethui()
	ScreenGui.Name = name or "Lorem Ipsum UI"

	local baseframe = gui("Frame","MainFrame",background,"",ScreenGui,10,frameTransparency)
	baseframe.Size = scale
	baseframe.Position = pos or UDim2.new(0.2,0,0.1,0)

	local leftFrame = gui("ScrollingFrame","LeftPanel",background,"",baseframe,10,1)
	leftFrame.Size = UDim2.new(0,180,1,-50)
	leftFrame.Position = UDim2.new(0,0,0,50)
	leftFrame.ChildAdded:Connect(function()
		local totalChild = 0
		for i,v in ipairs(leftFrame:GetChildren()) do
			if v:IsA("TextButton") then
				totalChild = totalChild + 1
			end
		end
	end)
	local line = gui("Frame","LeftSplit",LGui.baseborder,"",baseframe,10,0.1)
	line.Size = UDim2.new(0,2,1,-50)
	line.Position = UDim2.new(0,179,0,44)
	local rightFrame = gui("Frame","RightPanel",background,"",baseframe,10,1)
	rightFrame.Size = UDim2.new(1,-180,1,-50)
	rightFrame.Position = UDim2.new(0,180,0,50)

	local topPanel = gui("Frame","TopPanel",background,"",baseframe,10,1)
	topPanel.Size = UDim2.new(1,0,0,35)
	local TopSplit = gui("Frame","TopSplit",background,"",baseframe,10,0.1)
	TopSplit.Size = UDim2.new(1,0,0,2)
	TopSplit.Position = UDim2.new(0,0,0,35)

	local Title = gui("TextLabel","Title",background,name or "Title",topPanel,10,1)
	Title.Size = UDim2.new(1,-10,1,-10)
	Title.Position = UDim2.new(0,10,0,10)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextYAlignment = Enum.TextYAlignment.Top
	Title.TextScaled = false
	Title.TextSize = 12

	local CreatorName = gui("TextLabel","Description",background,descript or "Developed By Marlow Julius, VelDeNoire, & Jorell",topPanel,10,1)
	CreatorName.Size = UDim2.new(1,-10,1,-21)
	CreatorName.Position = UDim2.new(0,10,0,21)
	CreatorName.RichText = true
	CreatorName.TextXAlignment = Enum.TextXAlignment.Left
	CreatorName.TextYAlignment = Enum.TextYAlignment.Top
	CreatorName.TextScaled = false
	CreatorName.TextSize = 10
	local Icon = gui("ImageButton","Icon",background,"",ScreenGui,8,0)
	Icon.Image = LGui.icon
	Icon.Size = UDim2.new(0,50,0,50)
	Icon.Position = UDim2.new(0,40,0.34,-20)
	makeDraggable(Icon)
	local guiStat = true
	Icon.MouseButton1Click:Connect(function()
		guiStat = not guiStat
		baseframe.Visible = guiStat
		baseframe.Active = guiStat
	end)
	local close = gui("TextButton","Close",background,"X",baseframe,10,1)
	close.Size = UDim2.new(0,40,0,40)
	close.Position = UDim2.new(1,-40,0,0)
	close.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)
	local minimize = gui("TextButton","Close",background,"-",baseframe,10,1)
	minimize.Size = UDim2.new(0,40,0,40)
	minimize.Position = UDim2.new(1,-90,0,0)
	local min = false
	minimize.MouseButton1Click:Connect(function()
		min = not min
		if min then
			baseframe.Size = UDim2.new(scaleX,0,0,42)
			rightFrame.Visible = false
			line.Visible = false
			TopSplit.Visible = false
			rightFrame.Active = false
			leftFrame.Active = false
			leftFrame.Visible = false
		else
			baseframe.Size = scale
			rightFrame.Visible = true
			TopSplit.Visible = true
			line.Visible = true
			rightFrame.Active = true
			leftFrame.Active = true
			leftFrame.Visible = true
		end
	end)

	-- APPLY LAYOUT & PADDING
	createLayout(leftFrame,10)
	createPadding(leftFrame,10,10,10,20)

	createLayout(rightFrame,10)
	createPadding(rightFrame,10,10,10,10)


	for _,tabName in ipairs(tabNames) do
		local tabFrame = gui("ScrollingFrame",tabName,background,"",rightFrame,10,1)
		tabFrame.CanvasSize = UDim2.new(0,0,1,0)
		tabFrame.ScrollBarThickness = 10
		tabFrame.Size = LGui.tabsize
		tabFrame.Visible = false
		table.insert(tabs,tabFrame)
		tabs[tabName] = tabFrame
		local s = newButton({
			Background = background,
			Radius = 10,
			Transparency = 0.3,
			Size = UDim2.new(1,0,0,30),
			AlignmentX = Enum.TextXAlignment.Left,
			AlignmentY = Enum.TextYAlignment.Center,
		},
		tabName,
		leftFrame,
		function()
			show(tabs,tabFrame)
		end)
		s.TextScaled = false
		s.TextSize = 20
		createPadding(s,0,0,30,0)
	end

	if tabs[1] then
		show(tabs,tabs[1])
	end



	if dragable then
		makeDraggable(baseframe)
	end
	return ScreenGui
end
