-- This package provides file icon support for Neovim. It extends the functionality 
-- of nvim-tree by enabling it to display icons next to filenames in the file explorer sidebar. 
-- These icons make it easier for users to visually identify different types of files, 
-- such as images, documents, code files, etc., within the file tree view.

return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon({
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
    })
  end,
}
