return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Heure dynamique
    local hour = tonumber(os.date("%H"))
    local greeting
    if hour < 12 then
      greeting = "  Good morning"
    elseif hour < 18 then
      greeting = "  Good afternoon"
    else
      greeting = "  Good evening"
    end

    dashboard.section.header.val = {
      "                                                        ",
      "  ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗",
      "  ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝",
      "  ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ",
      "  ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ",
      "  ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗",
      "   ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
      "                                                        ",
      "          " .. greeting .. ", elghuost          ",
      "              " .. os.date("  %H:%M  —  %d/%m/%Y") .. "              ",
      "                                                        ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Chercher fichier",  ":Telescope find_files<CR>"),
      dashboard.button("r", "󰄉  Fichiers récents",  ":Telescope oldfiles<CR>"),
      dashboard.button("g", "󰊄  Chercher texte",    ":Telescope live_grep<CR>"),
      dashboard.button("e", "  Explorateur",        ":Neotree toggle<CR>"),
      dashboard.button("c", "  Configuration",      ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "󰅚  Quitter",           ":qa<CR>"),
    }

    dashboard.section.footer.val = {
      "                                    ",
      "  󰣠  I use NixOS, btw               ",
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
