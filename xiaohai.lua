local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "ImageDisplay"

local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = gui
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://102474550222753"

local function getGitSoundId(GithubSoundPath: string, AssetName: string)
    local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
         writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end
    local Sound = Instance.new("Sound")
    Sound.SoundId = (getcustomasset or getsynasset)(AssetName..".mp3")
    Sound.Name = (AssetName)
    return Sound 
end

local StartSound = getGitSoundId("https://github.com/nainshu/no/blob/main/hhhhhhh.mp3?raw=true", "ggggg")
StartSound.Parent = game.workspace
StartSound:Play()