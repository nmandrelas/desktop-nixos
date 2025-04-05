rebuild 

sudo nixos-rebuild switch --flake /etc/nixos#default

sudo nixos-rebuild switch --flake .

home-manager switch --flake .

nix flake update /etc/nixos

git add * && git commit -m