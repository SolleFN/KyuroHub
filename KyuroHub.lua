if game.PlaceId == 8992150289 then
    local eggName = ''
    local eggs = {}
    local rebirth_Amount = ''
    getgenv().AutoClick = false
    getgenv().AutoTrain = false
    getgenv().AutoRebirth = false
    getgenv().AutoEgg = false
    getgenv().clickToggle = false


    local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

    local w = library:CreateWindow("Main") -- Creates the window

    local f = w:CreateFolder("Farm") -- Creates the folder(U will put here your buttons,etc)

    local e = w:CreateFolder("Eggs")


    --Auto Click button
    f:Toggle("Auto Click",function(bool)
        getgenv().AutoClick = bool
        if bool then
            autoClick()
        else
            wait()
        end
    end)

    --Auto Rebirth button



    f:Dropdown("Select Amount of Rebirth",{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30},true,function(amount) --Replace the Dropdown name with the selected one(A,B,C)
        rebirth_Amount = amount
    end)


    f:Toggle("Auto Rebirth",function(bool)
        getgenv().AutoRebirth = bool
        if bool then
            autoRebirth(tonumber(rebirth_Amount))
        else
            wait()
        end
    end)

    --Auto train button
    f:Toggle("Auto Train",function(bool)
        getgenv().AutoTrain = bool
        if bool then
            autoTrain()
        else
            wait()
        end
    end)


    --EGG MISC
    --AUTO DETECT EGGS 
    for i,v in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do
        table.insert(eggs,v)
    end

    --CREATE A DROP DOWN WITH ALL EGGS
    e:Dropdown("Select Egg to open",{eggs[1],eggs[2],eggs[3],eggs[4],eggs[5],eggs[6],eggs[7],eggs[8],eggs[9],eggs[10],eggs[11],eggs[12],eggs[13],eggs[14],eggs[15]},true,function(mob) --Replace the Dropdown name with the selected one(A,B,C)
        eggName = mob
    end)

    e:Toggle("Auto Egg",function(bool)
        getgenv().AutoEgg = bool
        if bool then
            autoEgg(eggName)
        else
            wait()
        end
    end)





    function autoClick()
        spawn(function()
            while AutoClick == true do
                local args = {[1] = {}}
                game:GetService("ReplicatedStorage").Assets.Events:FindFirstChild("combat attack"):FireServer(unpack(args))
                wait()
            end
        end)
    end

    function autoRebirth(amount)
        spawn(function()
            while AutoRebirth == true do --I Rebirth sono 44 in totale
                local args = {[1] = {[1] = amount}}
                game:GetService("ReplicatedStorage").Assets.Events.rebirth:FireServer(unpack(args))
                wait()
            end
        end)
    end


    function autoTrain()
        spawn(function()
            while AutoTrain == true do
                local args = {[1] = {[1] = workspace.__MAP.Workouts.Training}}
                game:GetService("ReplicatedStorage").Assets.Events.training:InvokeServer(unpack(args))
                wait()
            end
        end)
    end

    function autoEgg(eggName)
        spawn(function()
            while wait() do
                if not AutoEgg then break end
                local args = {[1] = {[1] = eggName,[2] = false}}
                game:GetService("ReplicatedStorage").Assets.Events:FindFirstChild("buy egg"):InvokeServer(unpack(args))
            end
        end)
    end

    e:DestroyGui()
else
    print("Game don't found")
end
