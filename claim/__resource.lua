resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

game 'gta5'

author 'The_Rigewood#0130'

description 'A Script that lets players claim certain items.'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'server/server.lua'
}

client_scripts {
    '@es_extended/locale.lua'
}

dependencies {
    'es_extended'
}