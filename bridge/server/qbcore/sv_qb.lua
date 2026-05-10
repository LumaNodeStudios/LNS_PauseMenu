if Framework ~= 'qbcore' then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Bridge.GetPlayerData(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return nil end

    return {
        playerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        jobName = Player.PlayerData.job.label,
        sex = Player.PlayerData.charinfo.gender == 0 and "Male" or "Female",
        dateOfBirth = Player.PlayerData.charinfo.birthdate
    }
end
