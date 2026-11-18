{ ... }: {

	flake.nixosModules.nixvim =

		{ config, pkgs, ... }: {

			programs.nixvim = {

				enable = true;
				defaultEditor = true;

				colorschemes.catppuccin = {
					enable = true;
					settings.flavour = "mocha";
				};

				extraPackages = [ pkgs.ruff ];

				plugins = {

					nui.enable = true;

					telescope.enable = true;

					markview.enable = true;
					web-devicons.enable = true;

					treesitter = {
						enable = true;
						highlight.enable = true;
						indent.enable = true;
					};

					lsp = {
						enable = true;
						servers = {
							pyright.enable = true;
							ruff.enable = true;
						};
					};

					cmp = {
						enable = true;
						settings = {
							sources = [
								{ name = "nvim_lsp"; }
								{ name = "path"; }
								{ name = "buffer"; }
							];
							mapping = {
								"<C-Space>" = "cmp.mapping.complete()";
								"<CR>" = "cmp.mapping.confirm()";
								"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
								"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
							};
						};
					};

					conform-nvim = {
						enable = true;
						settings = {
							formatters_by_ft = {
								"_" = [
									"squeeze_blanks"
									"trim_whitespace"
									"trim_newlines"
								];
								python = [
									"ruff_organize_imports"
									"ruff_format"
									"ruff_fix"
								];
							};
							format_on_save = {
								timeout_ms = 500;
								lsp_format = "fallback";
							};
						};
					};

					avante = {
						enable = true;
						settings = {
							provider = "ollama";
							mode = "legacy";
							providers.ollama = {
								endpoint = "http://127.0.0.1:11434";
								model = "qwen2.5-coder:7b";
								disable_tools = true;
							};
						};
					};

				};

			};

		};

}
