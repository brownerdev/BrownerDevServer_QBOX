KaboDeliverySecurity = KaboDeliverySecurity or {}

local activeContracts = {}

function KaboDeliverySecurity.hasActiveContract(source)
    return activeContracts[source] ~= nil
end

function KaboDeliverySecurity.setActiveContract(source, contract)
    activeContracts[source] = contract
end

function KaboDeliverySecurity.clearActiveContract(source)
    activeContracts[source] = nil
end

AddEventHandler('playerDropped', function()
    KaboDeliverySecurity.clearActiveContract(source)
end)
