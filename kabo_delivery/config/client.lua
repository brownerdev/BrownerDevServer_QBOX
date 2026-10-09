Config = Config or {}

Config.DeliveryPed = {
    enabled = true,
    model = 's_m_m_ups_01',
    coords = vec4(1197.21, -3252.33, 6.1, 99.68),
    scenario = 'WORLD_HUMAN_CLIPBOARD',
    modelLoadTimeout = 5000,
    target = {
        icon = 'fa-solid fa-box-open',
        label = 'Talk to Darrel',
        distance = 2.0
    },
    blip = {
        enabled = true,
        sprite = 478,
        color = 5,
        scale = 0.75,
        label = 'Delivery Dispatcher'
    }
}
