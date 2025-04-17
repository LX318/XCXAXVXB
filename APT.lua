local getinfo = getinfo or debug.getinfo
local DEBUG = false
local Hooked = {}

local Detected, Kill

setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                
                return true
            end)

            table.insert(Hooked, Detected)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)

            table.insert(Hooked, Kill)
        end
    end
end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...

    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`zins | adonis bypassed`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return Old(...)
end))
-- setthreadidentity(9)
setthreadidentity(7)

local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "你的脚本名称（穷小子）",
    Text = "正在加载",
    Duration = 5
})
print("反挂机开启")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ChinaQY/-/Main/UI'))()
local Window = OrionLib:MakeWindow({Name = "穷小子脚本", HidePremium = false, SaveConfig = true, IntroText = "欢迎使用穷小子脚本", ConfigFolder = "欢迎使用穷小子脚本"})
local about = Window:MakeTab({
    Name = "脚本名称",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
about:AddParagraph("您的用户名:", " "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:", " "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID", " "..game.GameId.."")
local Tab = Window:MakeTab({
    Name = "刷钱",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 定义自动互动的全局变量
local autoInteract = false

Tab:AddToggle({
    Name = "自动互动 (10米内)",
    Callback = function(state)
        autoInteract = state
        if autoInteract then
            -- 开始自动互动循环
            spawn(function()
                local player = game.Players.LocalPlayer
                while autoInteract and task.wait(0.1) do -- 降低延迟，提高响应速度
                    -- 检查玩家角色是否存在
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local rootPos = player.Character.HumanoidRootPart.Position
                        -- 遍历场景中的ProximityPrompt
                        for _, obj in pairs(workspace:GetDescendants()) do
                            if autoInteract and obj:IsA("ProximityPrompt") then
                                -- 检查是否在10米范围内
                                local parent = obj.Parent
                                if parent and parent:IsA("BasePart") then
                                    local distance = (parent.Position - rootPos).Magnitude
                                    if distance <= 10 then
                                        fireproximityprompt(obj) -- 触发互动
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})
Tab:AddButton({
	Name = "一直丢绿宝石（费钱）",
	Callback = function()

local args = {
    [1] = 1
}
local replicatedStorage = game:GetService("ReplicatedStorage")
local events = replicatedStorage:WaitForChild("Events")
local dropCashEvent = events:WaitForChild("DropCash")

while true do
    dropCashEvent:FireServer(unpack(args))
    wait(0.01) 
end

end
})
Tab:AddButton({
	Name = "隐形[FE]",
	Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()

end
})
Tab:AddButton({
	Name = "甩飞",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()

end
})
