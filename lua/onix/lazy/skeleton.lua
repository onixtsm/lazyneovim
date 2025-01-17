return {
  "motosir/skel-nvim",
  config = function()
    require("skel-nvim").setup {
      templates_dir = vim.fn.stdpath("config") .. "/skeletons", -- file pattern -> template mappings
      mappings = {
        ['*.cpp']   = "skeleton.cpp",
        ['*.h']     = "skeleton.h",
        ['main.c']  = "skeleton.main.c",
        -- patterns can map to multiple templates
        ['LICENSE'] = { "license.mit.skel", "license.gpl.skel" }
      }
    }
  end
}
