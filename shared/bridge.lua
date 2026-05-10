Bridge = {}

function Bridge.GetFramework()
    if GetResourceState('qbx_core') == 'started' then
        return 'qbox'
    elseif GetResourceState('qb-core') == 'started' then
        return 'qbcore'
    elseif GetResourceState('es_extended') == 'started' then
        return 'esx'
    end
    return nil
end

Framework = Bridge.GetFramework()
