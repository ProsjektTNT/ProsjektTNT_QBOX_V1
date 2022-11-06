fx_version 'cerulean'
game 'gta5'

version '1.0.0'
repository 'https://github.com/Qbox-project/qb-busjob'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua'
}

client_script 'client/main.lua'

server_script 'server/main.lua'

dependency 'ox_lib'

lua54 'yes'
