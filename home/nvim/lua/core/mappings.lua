local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Fenêtre gauche" })
map("n", "<C-l>", "<C-w>l", { desc = "Fenêtre droite" })
map("n", "<C-j>", "<C-w>j", { desc = "Fenêtre bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Fenêtre haut" })

-- Buffers
map("n", "<Tab>", ":bnext<CR>", { desc = "Buffer suivant" })
map("n", "<S-Tab>", ":bprev<CR>", { desc = "Buffer précédent" })
map("n", "<leader>x", ":bdelete<CR>", { desc = "Fermer buffer" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Chercher fichier" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Chercher texte" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Chercher buffer" })

-- Neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer fichiers" })

-- LSP (définis dans lspconfig)
map("n", "gd", vim.lsp.buf.definition, { desc = "Aller à la définition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Documentation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions code" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renommer" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic précédent" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic suivant" })

-- Utilitaires
map("n", "<leader>w", ":w<CR>", { desc = "Sauvegarder" })
map("n", "<leader>q", ":q<CR>", { desc = "Quitter" })
map("n", "<Esc>", ":noh<CR>", { desc = "Effacer surbrillance" })
map("v", "<", "<gv", { desc = "Indenter gauche" })
map("v", ">", ">gv", { desc = "Indenter droite" })
