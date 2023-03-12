fx_version "cerulean"
games { 'rdr3', 'gta5' }

name "deerRPChat"

description "deerRPChat - A simple script to add roleplay chats"
author "TheeDeer"

version "1.0"

lua54 'yes'

shared_scripts {
    "config.lua",
}

client_scripts {
    "client.lua",
}

server_scripts {
    "server.lua",
}
