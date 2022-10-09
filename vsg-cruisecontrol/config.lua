vsg = {}

vsg.minimumspeed = 50                   -- minimum speed to activate cruise control
vsg.key = 47                            -- key to activate/deactivate cruise control
vsg.notify = function(msg)              -- notify system used
    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(false, true)
end

