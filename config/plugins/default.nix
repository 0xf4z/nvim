{ lib, isMaximal, ... }:
{
  imports = [
    ./lualine.nix
    ./mini.nix
    # ./live-preview.nix
    ./alpha.nix
  ];

  config.vim = {
    # live preview
#    utility.preview.livePreview.enable = isMaximal;
    # gitsigns (gitgutter alternative)
    git.gitsigns = {
      enable = true;
      setupOpts = {
        signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
        attach_to_untracked = false;
        signs_staged_enable = false;
      };
    };

    # telescope
    telescope = {
      enable = true;
      mappings = {
        buffers = "<leader>fb";
        findFiles = "<C-p>";
        liveGrep = "<C-g>";
      };
    };

    # autocomplete bracket pairs
    autopairs.nvim-autopairs = {
      enable = true;
      setupOpts.disable_filetype = [
        "TelescopePrompt"
        "vim"
      ];
    };

    # indent guides
    visuals.indent-blankline.enable = true;

    # highlighting colours
    ui.colorizer = {
      enable = true;
      setupOpts.user_default_options = {
        mode = "background";
        virtualtext = "■";
      };
    };
  };
}
