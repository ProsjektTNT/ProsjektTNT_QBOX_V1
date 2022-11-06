fx_version 'cerulean'
game 'gta5'

version '1.0.0'
repository 'https://github.com/Qbox-project/qb-pawnshop'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_script 'client/main.lua'

lua54 'yes'
