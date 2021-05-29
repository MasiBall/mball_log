--Configuration--
local discordwebhook = ''
--End Of Configuration--

--Getting Timestamp
local date = os.date('*t')
	
if date.day < 10 then date.day = '0' .. tostring(date.day) end
if date.month < 10 then date.month = '0' .. tostring(date.month) end
if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
if date.min < 10 then date.min = '0' .. tostring(date.min) end
if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
--

--Player Connecting
AddEventHandler('playerConnecting', function()
  local _source = source
  local name = GetPlayerName(_source)
  local license = nil
  local identifier = nil
	local discord = nil
	for k,v in ipairs(GetPlayerIdentifiers(_source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
		  license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
      xbl = v
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
      live = v
    elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
      fivem = v
	  end
  end
  if license == nil then
    license = "No License found"
  end
  if identifier == nil then
    identifier = "No Hex-ID found"
  end
  if discord == nil then
    discord = "No Discord found"
  end
  if xbl == nil then
    xbl = "No xbl ID found"
  end
  if live == nil then
    live = "No Live ID found"
  end
  if fivem == nil then
    fivem = "No FiveM ID found"
  end
    sendToDiscordLogsEmbed(3158326, '`✅` | PLAYER CONNECTING',' Player: `' .. name .. '`\n Hex-ID: `' ..identifier.. '`\n License: `' ..license.. '`\n Discord ID: `' ..discord.. '`\n XBL ID: `' ..xbl.. '`\n Live ID: `' ..live.. '`\n FiveM ID: `' ..fivem.. '`\n IP: `' ..GetPlayerEndpoint(_source).. '`', 'Made By MasiBall -- Timestamp: ' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec)
end)

--Player Leaving
AddEventHandler('playerDropped', function(reason)
  local _source = source
  local name = GetPlayerName(_source)
  local license = nil
  local identifier = nil
	local discord = nil
  for k,v in ipairs(GetPlayerIdentifiers(_source))do
    if string.sub(v, 1, string.len("license:")) == "license:" then
      license = v
    elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
      identifier = v
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
      discord = v
    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
      xbl = v
    elseif string.sub(v, 1, string.len("live:")) == "live:" then
      live = v
    elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
      fivem = v
    end
  end
  if license == nil then
    license = "No License found"
  end
  if identifier == nil then
    identifier = "No Hex-ID found"
  end
  if discord == nil then
    discord = "No Discord found"
  end
  if xbl == nil then
    xbl = "No xbl ID found"
  end
  if live == nil then
    live = "No Live ID found"
  end
  if fivem == nil then
    fivem = "No FiveM ID found"
  end
    sendToDiscordLogsEmbed(3158326, '`❌` | PLAYER DROPPED',' Reason: `' ..reason.. '`\n Player: `' ..name.. '`\n Hex-ID: `' ..identifier.. '`\n License: `' ..license.. '`\n Discord ID: `' ..discord.. '`\n XBL ID: `' ..xbl.. '`\n Live ID: `' ..live.. '`\n FiveM ID: `' ..fivem.. '`\n IP: `' ..GetPlayerEndpoint(_source).. '`', 'Made By MasiBall -- Timestamp: ' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec)
end)

function sendToDiscordLogsEmbed(color, name, message, footer)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

  PerformHttpRequest(discordwebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end