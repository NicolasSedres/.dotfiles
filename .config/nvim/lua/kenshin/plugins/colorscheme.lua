return {
  "rebelot/kanagawa.nvim", --theme,
  priority = 1000,

  config = function()
    local colorscheme = "kanagawa-dragon"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      vim.notify("colorscheme " .. colorscheme .. " not found!")
      return
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  end,
}
