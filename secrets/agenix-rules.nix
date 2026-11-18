let
	predator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgz8JAhxvHW/+KsyTxcaBHJJ/3NtrQNucR/s0OLclnu root@predator";
	dctspommy = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAoiCU+VkCmgLYQWvsZ6dhsWqy+HSdUAMY4cSnpKFI0k dctspommy@predator";
in
{
	"nix-token.age".publicKeys = [ predator dctspommy ];
}
