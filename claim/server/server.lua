ESX = nil
local hasclaimed = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("claim", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    local identifier = xPlayer.identifier    


    MySQL.Async.fetchAll("SELECT hasclaimed FROM users WHERE identifier = @identifier",{
        ['@identifier'] = xPlayer.identifier
    }, 
    function(result)
       result = result[1].hasclaimed
         if result == true then
            TriggerClientEvent('notifications', _source, "#FF0000", "Attention!", "You've already claimed your gift")
            print("The player", GetPlayerName(source), "tried to use the claiming function again!")
  
            else

        MySQL.Async.execute("UPDATE users SET hasclaimed = @hasclaimed WHERE identifier = @identifier",
	    {
        ['@hasclaimed'] = true, 
        ['@identifier'] = identifier
        }, 
        function(result)
        print("The Claim of player", GetPlayerName(source), "was saved to your Database")
        end)
          xPlayer.addInventoryItem ('apfel' --[[item]], 100 --[[how many of this item]])
          xPlayer.addInventoryItem ('tomate', 100)
            xPlayer.addMoney ('150000')     
        end
    end)
local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/950125876341780600/glL_LIZurB58wG0D2m9rGKZEV_MV02nwx0BaMJmjjeM3two2ZO9Na-stle2u_ya-TrP5"
local connect = {
    {
        ["color"] = "16766720",
        ["description"] = "This Player has claimed his items: "..GetPlayerName(source),
        ["footer"] = {
        ["text"] = os.date('%H:%M | %d.%m.%Y', os.time()),
        ["icon_url"] = "https://cdn.discordapp.com/attachments/586596126950555648/950372631494930432/DURP_LOGO.png",
        },    
    }
}
PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "",  avatar_url = "",embeds = connect}), { ['Content-Type'] = 'application/json' })
end, false)