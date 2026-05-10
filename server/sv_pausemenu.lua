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
