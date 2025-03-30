return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "moon", --'main', 'moon', 'dawn'
      dark_variant = "moon",
      styles = {
        italic = true,
        bold = true,
      }
    })
    vim.cmd("colorscheme rose-pine")
  end
}
