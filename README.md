rebuild 

sudo nixos-rebuild switch --flake .#desktop
home-manager switch --flake .#desktop

sudo nixos-rebuild switch --flake .#laptop
home-manager switch --flake .#laptop


nix flake update --flake  /etc/nixos

git add * && git commit -m

sudo nix-collect-garbage -d 

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

nmcli device wifi list

nmcli device wifi connect "name" password "passwd"