{ lib, isMaximal, ... }:
{
  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;

      servers.clangd.cmd = lib.mkForce [ "clangd" ];
    };

    treesitter.indent.enable = false;

    languages = {
      enableTreesitter = true;

      bash.enable = true;
      nix = {
        enable = true;
        lsp.servers = [ "nil" ];
      };
      markdown = {
        enable = true;
        lsp.enable = isMaximal;
      };
      rust.enable = isMaximal;
      typescript.enable = isMaximal;
    };
  };
}
