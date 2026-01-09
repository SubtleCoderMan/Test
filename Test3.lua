local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeShopOperationRequest")

-- what to upgrade hp 5x then 1x dmg 
local upgradePlan = {
    {"TroopHealth", 5},
    {"TroopDamage", 1}
}

for _, plan in ipairs(upgradePlan) do
    local upgradeType, times = plan[1], plan[2]



    for i = 1, times do
        local args = {"Barracks", upgradeType}

        local success, result = pcall(function()
            return remote:InvokeServer(unpack(args))
        end)



        if i < times then
            wait(0.1)  -- Delay 
        end
    end
end
