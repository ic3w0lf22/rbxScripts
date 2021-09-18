if not Name then return false end

local InputService = game:GetService'UserInputService'
local Player = game:GetService'Players'.LocalPlayer
local Mouse = Player:GetMouse()
local Choices = Player:WaitForChild'PlayerGui':WaitForChild'DialogueGui':WaitForChild'DialogueFrame':WaitForChild'Choices'

while not InputService:IsKeyDown'F' do
    local Button = Choices:FindFirstChild(Name) or Choices:WaitForChild'None of these.':WaitForChild'TextButton'
    local Position = Button.AbsolutePosition + Button.AbsoluteSize / 2

    mousemoverel(Position.X - Mouse.X, Position.Y - Mouse.Y)

    task.wait(0.05)

    if (Vector2.new(Mouse.X, Mouse.Y) - Position).Magnitude < 10 then
        task.wait(0.05)

        mouse1click()

        if Button.Name ~= Name then
            Choices.ChildAdded:Wait()
            task.wait(0.1)
        else
            break
        end
    end
end
