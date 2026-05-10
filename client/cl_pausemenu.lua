local Settings = lib.load('shared.settings')
local pauseMenuActive = false
local startTime = GetGameTimer()

local function getPlayTime()
    local currentTime = GetGameTimer()
    local diff = currentTime - startTime
    local hours = math.floor(diff / 3600000)
    local minutes = math.floor((diff % 3600000) / 60000)
    return string.format("%d hours %d minutes", hours, minutes)
end

local function openPauseMenu()
    if LocalPlayer.state.invOpen then return end
    
    local data = lib.callback.await('LNS_PauseMenu:getPlayerData', 100)
    local mugshot = exports['MugShotBase64']:GetMugShotBase64(cache.ped, false)
    
    if data then
        SendNUIMessage({
            action = 'setVisible',
            data = true,
            config = {
                navButtons = Settings.NavButtons,
                infoCards = Settings.InfoCards,
                serverName = Settings.ServerName,
                timezone = Settings.Timezone,
                imageMap = Settings.ImageMap,
                announcements = data.announcements or Settings.Announcements
            },
            playTime = getPlayTime(),
            theme = Settings.Theme
        })
        SendNUIMessage({
            action = 'updatePlayerData',
            data = {
                id = GetPlayerServerId(PlayerId()),
                name = data.playerName,
                job = data.jobName,
                gender = data.sex,
                dob = data.dateOfBirth or "01-01-1990",
                avatar = mugshot
            }
        })
        SetNuiFocus(true, true)
        TriggerScreenblurFadeIn(500)
        pauseMenuActive = true
    end
end

RegisterNUICallback('hide-ui', function(data, cb)
    TriggerScreenblurFadeOut(500)
    SetNuiFocus(false, false)
    pauseMenuActive = false
    SendNUIMessage({action = 'setVisible', data = false})
    cb('ok')
end)

RegisterNUICallback('map', function(data, cb)
    pauseMenuActive = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    SendNUIMessage({action = 'setVisible', data = false})
    ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, -1)
    cb('ok')
end)

RegisterNUICallback('settings', function(data, cb)
    pauseMenuActive = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    SendNUIMessage({action = 'setVisible', data = false})
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), 0, -1)
    cb('ok')
end)

RegisterNUICallback('keybinds', function(data, cb)
    pauseMenuActive = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    SendNUIMessage({action = 'setVisible', data = false})
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_KEYMAPPING_MENU'), 0, -1)
    cb('ok')
end)

RegisterNUICallback('logout', function(data, cb)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    SendNUIMessage({action = 'setVisible', data = false})
    pauseMenuActive = false
    TriggerServerEvent("LNS_PauseMenu:exitGame")
    cb('ok')
end)

CreateThread(function()
    while true do
        Wait(0)
        DisableControlAction(0, 200, true)
        if IsPauseMenuActive() then
            SetPauseMenuActive(false)
        end
    end
end)

lib.addKeybind({
    name = 'PauseMenu',
    description = 'Toggle Pause Menu',
    defaultKey = Settings.Keybind,
    onPressed = function()
        if not pauseMenuActive then
            openPauseMenu()
        end
    end
})
