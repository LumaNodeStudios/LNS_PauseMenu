local Settings = lib.load('shared.settings')
local Announcements = Settings.Announcements

lib.callback.register('LNS_PauseMenu:getPlayerData', function(source)
    local data = Bridge.GetPlayerData(source)
    if data then
        data.announcements = Announcements
    end
    return data
end)

RegisterNetEvent('LNS_PauseMenu:exitGame', function()
    local src = source
    DropPlayer(src, "You have logged out.")
end)

lib.addCommand('addannouncement', {
    help = 'Add a live announcement to the pause menu',
    params = {
        { name = 'author', help = 'Author Name', type = 'string' },
        { name = 'title', help = 'Announcement Title', type = 'string' },
        { name = 'content', help = 'Announcement Content', type = 'string' },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local author = args.author
    local title = args.title
    local content = args.content
    local date = os.date("%d-%m-%Y")
    local time = os.date("%H:%M")

    table.insert(Announcements, 1, {
        author = author,
        date = date,
        time = time,
        title = title,
        content = content
    })

    if #Announcements > 10 then
        table.remove(Announcements, #Announcements)
    end

    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Announcement Added',
        description = 'The announcement has been added to the pause menu.',
        type = 'success'
    })
end)

CreateThread(function()
    local resource = GetCurrentResourceName()
    local currentVersion = GetResourceMetadata(resource, 'version', 0) or '1.0.0'
    
    PerformHttpRequest('https://raw.githubusercontent.com/LumaNodeStudios/LNS_PauseMenu/main/fxmanifest.lua', function(status, response, headers)
        if status ~= 200 then
            print('^3[' .. resource .. '] ^7Unable to check for updates (Status: ' .. status .. ')^0')
            return
        end
        
        local latestVersion = response:match("version%s+'([%d%.]+)'") or response:match('version%s+"([%d%.]+)"')
        
        if not latestVersion then
            print('^3[' .. resource .. '] ^7Unable to parse version from GitHub^0')
            return
        end
        
        if currentVersion ~= latestVersion then
            print('^0====================================^0')
            print('^3[' .. resource .. '] ^1Update Available!^0')
            print('^7Current Version: ^3' .. currentVersion .. '^0')
            print('^7Latest Version: ^2' .. latestVersion .. '^0')
            print('^7Download: ^5https://github.com/LumaNodeStudios/LNS_PauseMenu^0')
            print('^0====================================^0')
        else
            lib.print.info('^7You are running the latest version (^2' .. currentVersion .. '^7)^0')
        end
    end, 'GET')
end)