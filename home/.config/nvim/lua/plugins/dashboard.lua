local function default_header()
	return {
		"", "",
"    ██████                ███    █████████                     ",
"  ███░░░░███             ░░░    ███░░░░░███                    ",
" ███    ░░███ █████ ████ ████  ███     ░░░   ██████  ████████  ",
"░███     ░███░░███ ░███ ░░███ ░███          ███░░███░░███░░███ ",
"░███   ██░███ ░███ ░███  ░███ ░███    █████░███ ░███ ░███ ░███ ",
"░░███ ░░████  ░███ ░███  ░███ ░░███  ░░███ ░███ ░███ ░███ ░███ ",
" ░░░██████░██ ░░████████ █████ ░░█████████ ░░██████  ████ █████",
"   ░░░░░░ ░░   ░░░░░░░░ ░░░░░   ░░░░░░░░░   ░░░░░░  ░░░░ ░░░░░ ",
    "", ""
	}
end

require('dashboard').setup {
	theme = 'doom',
	config = {
		header = default_header(),
		center = {
			{
				icon = '󰙅 ',
				icon_hl = 'Title',
				desc = '1.Файловый менеджер: ',
				desc_hl = 'String',
				key = 'm',
				--keymap = 'keymap -> <C-f>',
				key_format = ' [%s]',
				key_hl = 'Number',
				action = ':Neotree float'
			},
			{
				icon = '󰈞 ',
				icon_hl = 'Title',
				desc = '2.Найти файл: ',
				desc_hl = 'String',
				key = 'f',
				--keymap = 'SPC f f',
				key_hl = 'Number',
				action = ':Telescope find_files'
			},
			{
				icon = ' ',
				icon_hl = 'Title',
				desc = '3.Найти текст в файле: ',
				desc_hl = 'String',
				key = 'w',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Telescope live_grep'
			},
			{
				icon = '󰯙 ',
				icon_hl = 'Title',
				desc = '4.Mason - Менеджер LSP: ',
				desc_hl = 'String',
				key = 'l',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Mason'
			},
			{
				icon = '󰒲 ',
				icon_hl = 'Title',
				desc = '5.Lazy - Пакетный менеджер: ',
				desc_hl = 'String',
				key = 'p',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Lazy'
			},
		}
	}
}
