if Framework ~= 'qbox' then return end

function Bridge.GetPlayerData(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return nil end

    return {
        playerName = player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname,
        jobName = player.PlayerData.job.label,
        sex = player.PlayerData.charinfo.gender == 0 and "Male" or "Female",
        dateOfBirth = player.PlayerData.charinfo.birthdate
    }
end
