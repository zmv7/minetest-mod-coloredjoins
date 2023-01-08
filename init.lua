local S = core.get_translator("coloredjoins")
function core.send_join_message(player_name)
	if not core.is_singleplayer() then
		local tags = ""
		local pinfo = core.get_player_information(player_name)
		if pinfo and pinfo.version_string and pinfo.version_string ~= "" then
			tags = " ["..pinfo.version_string.."]"
		end
		if pinfo and pinfo.lang_code and pinfo.lang_code ~= "" then
			local lang = langs[pinfo.lang_code] or pinfo.lang_code
			tags = tags.." ["..lang.."]"
		end
			core.chat_send_all(core.colorize("#30e830",">> ")..core.colorize("#FF0",player_name)..core.colorize("#30e830",S(" joined the server")..tags))
	end
end
function core.send_leave_message(player_name, timed_out)
	local announcement = core.colorize("#ec2121","<< ")..core.colorize("#FF0",player_name)..core.colorize("#ec2121",S(" left the server"))
	if timed_out then
		announcement = core.colorize("#ec2121","<< ")..core.colorize("#FF0",player_name)..core.colorize("#ec2121",S(" left the server (timed out)"))
	end
	core.chat_send_all(announcement)
end
