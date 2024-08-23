local chainsaw = game:GetService("InsertService"):LoadAsset(345753709) -- loads the chainsaw model
chainsaw.Parent = game.Workspace -- parents the chainsaw to the workspace

local song = Instance.new("Sound") -- creates a new sound object
song.SoundId = "rbxassetid://"..4815025241 -- sets the sound id to the chainsaw attack song
song.Parent = chainsaw -- parents the sound to the chainsaw

local deathScream = Instance.new("Sound") -- creates a new sound object
deathScream.SoundId = "rbxassetid://"..5546573724 -- sets the sound id to the death scream
deathScream.Parent = chainsaw -- parents the death scream to the chainsaw

local animation = Instance.new("Animation") -- creates a new animation object
animation.AnimationId = "rbxassetid://"..animationId -- sets the animation id (replace with your animation id)
animation.Parent = chainsaw -- parents the animation to the chainsaw

local function onTouch(hit)
local character = hit.Parent
if character and character:FindFirstChild("Humanoid") then
local humanoid = character.Humanoid
humanoid.TakeDamage(100) -- deals 100 damage to the player
song:Play() -- plays the chainsaw attack song
wait(2) -- waits for 2 seconds
deathScream:Play() -- plays the death scream

-- plays the animation
animation:Play()

-- creates a simple explosion effect
local explosion = Instance.new("Explosion")
explosion.Position = character.HumanoidRootPart.Position
explosion.Parent = game.Workspace
wait(1) -- waits for 1 second
explosion:Destroy() -- destroys the player

local function onTouch(hit)
local character = hit.Parent
if character and character:FindFirstChild("Humanoid") then
local humanoid = character.Humanoid
humanoid.TakeDamage(100) -- deals 100 damage to the player

-- broadcasts message to all players for 10 seconds
local message = "PLAYER IS COMING!"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(10)

-- adds blood effect
local blood = Instance.new("ParticleEmitter")
blood.Position = character.HumanoidRootPart.Position
blood.Parent = character

-- adds death ragdoll
local ragdoll = Instance.new("RagdollConstraint")
ragdoll.Parent = character.HumanoidRootPart
ragdoll.Enabled = true

-- displays "you die" screen
local youDiescreen = Instance.new("ScreenGui")
youDiescreen.DisplayOrder = 10
local youDieLabel = Instance.new("TextLabel")
youDieLabel.Text = "YOU DIED!"
youDieLabel.FontSize = 36
youDieLabel.Font = Enum.Font.SourceSans
youDieLabel.TextColor3 = Color3.new(1, 0, 0)
youDieLabel.Size = UDim2.new(0, 200, 0, 50)
youDieLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
youDieLabel.AnchorPoint = Vector2.new(0.5, 0.5)
youDieLabel.Parent = youDiescreen
youDiescreen.Parent = character.PlayerGui

-- waits for 2 seconds
wait(2)

-- prevents player from respawning
character.Humanoid.Die()
character:Destroy()
end
end

chainsaw.Touched:Connect(onTouch)
