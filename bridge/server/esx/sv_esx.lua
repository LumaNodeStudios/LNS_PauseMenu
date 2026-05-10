if Framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

function Bridge.GetPlayerData(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end

    local sexVar = xPlayer.get('sex')
    local sex = "Female"
    if sexVar == 'm' or sexVar == 'M' or sexVar == '0' or sexVar == 0 then
        sex = "Male"
    end

    return {
        playerName = xPlayer.getName() or GetPlayerName(source),
        jobName = xPlayer.job and xPlayer.job.label or "Unemployed",
        sex = sex,
        dateOfBirth = xPlayer.get('dateofbirth') or "01-01-1990"
    }
end
