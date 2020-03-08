

CreateTimer(function()
    _.forEach(GetAllPlayers(), function(p)
        CallEvent("OGK:API:CREDIT_PLAYER", p, 100)
        AddPlayerChat('Gained 100$')
    end)
end, 60000)
