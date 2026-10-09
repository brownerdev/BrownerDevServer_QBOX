Config = Config or {}

Config.Debug = true

Config.ContractTypes = {
    standard = {
        label = 'Standard Courier Run',
        description = 'A basic delivery with no special handling requirements.'
    },
    fragile = {
        label = 'Fragile Cargo',
        description = 'Careless driving may cost the bonus once cargo handling is added.'
    },
    rush = {
        label = 'Rush Order',
        description = 'A timed delivery for players who want a little pressure.'
    }
}

Config.DeliveryZones = {
    {
        name = 'docks',
        label = 'Port of Los Santos',
        coords = vec3(1197.21, -3252.33, 6.1)
    },
    {
        name = 'industrial',
        label = 'Cypress Flats',
        coords = vec3(864.35, -2364.18, 30.35)
    },
    {
        name = 'city',
        label = 'Downtown Drop-Off',
        coords = vec3(215.76, -810.12, 30.73)
    }
}
