local hl = vim.api.nvim_set_hl

local p = {
	fg = "#cdd6f4",
	bg = "NONE",
	red = "#f38ba8",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	blue = "#89b4fa",
	purple = "#cba6f7",
	cyan = "#89dceb",
	orange = "#fab387",
	comment = "#6c7086",
	surface = "#313244",
	overlay = "#45475a",
}

hl(0, "Normal", { fg = p.fg, bg = p.bg })
hl(0, "NormalFloat", { bg = "NONE" })
hl(0, "Comment", { fg = p.comment, italic = true })
hl(0, "String", { fg = p.green })
hl(0, "Number", { fg = p.orange })
hl(0, "Statement", { fg = p.purple })
hl(0, "Boolean", { fg = p.orange })
hl(0, "Keyword", { fg = p.purple })
hl(0, "Function", { fg = p.blue })
hl(0, "Type", { fg = p.cyan })
hl(0, "Special", { fg = p.yellow })
hl(0, "Identifier", { fg = p.fg })
hl(0, "Operator", { fg = p.cyan })
hl(0, "Error", { fg = p.red })
hl(0, "Warning", { fg = p.yellow })

-- ui
hl(0, "CursorLine", { bg = p.surface })
hl(0, "CursorLineNr", { fg = p.yellow, bold = true })
hl(0, "LineNr", { fg = p.overlay })
hl(0, "SignColumn", { bg = "NONE" })
hl(0, "StatusLine", { fg = p.fg, bg = p.surface })
hl(0, "Visual", { bg = p.overlay })
hl(0, "Search", { fg = "#1e1e2e", bg = p.yellow, bold = true })
hl(0, "IncSearch", { fg = "#1e1e2e", bg = p.yellow, bold = true })

-- treesitter
hl(0, "@variable", { fg = p.fg })
hl(0, "@function", { fg = p.blue })
hl(0, "@function.builtin", { fg = p.yellow, bold = true })
hl(0, "@keyword", { fg = p.purple })
hl(0, "@string", { fg = p.green })
hl(0, "@type", { fg = p.cyan })
hl(0, "@property", { fg = p.fg })
hl(0, "@parameter", { fg = p.red })

-- flash
hl(0, "FlashMatch", { fg = p.fg, bg = p.surface })
hl(0, "FlashCurrent", { fg = p.bg, bg = p.yellow })
hl(0, "FlashLabel", { fg = p.yellow, bg = p.surface, bold = true, italic = true })

-- lsp
hl(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.type.variable", { link = "@function.call" })
