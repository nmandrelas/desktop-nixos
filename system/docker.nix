{ config, pkgs, lib,hostType, ... }: {
  # Docker
  virtualisation.docker = {
    enable = true;
    daemon.settings.features.cdi = true;
    rootless = {
      enable = false;
      setSocketVariable = true;
    };
    daemon.settings = {
      default-runtime = "nvidia";
      cdi = true;
      runtimes = {
        nvidia = {
          path = "nvidia-container-runtime";
          runtimeArgs = [ ];
        };
      };
    };
  };
  virtualisation.docker.daemon.settings = { data-root = "~/docker"; };

  # Cuda toolkit, TODO disable staff on laptop
  hardware.nvidia-container-toolkit.enable = true;
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
  ];

}
