local isDispatcherOpen = false

local function openDispatcher()
    if isDispatcherOpen then return end

    isDispatcherOpen = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'openDispatcher'
    })
end

local function closeDispatcher()
    isDispatcherOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'closeDispatcher'
    })
end

RegisterNetEvent('kabo_delivery:client:openDispatcher', function()
    openDispatcher()
end)

RegisterNUICallback('closeDispatcher', function(_, cb)
    closeDispatcher()
    cb({})
end)

RegisterCommand('kdeliveryclose', function()
    closeDispatcher()
end, false)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    SetNuiFocus(false, false)
end)