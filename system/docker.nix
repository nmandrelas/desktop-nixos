{ config, pkgs, ... }: {
  # Docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      default-runtime = "nvidia";
      runtimes = {
        nvidia = {
          path = "nvidia-container-runtime";
          runtimeArgs = [ ];
        };
      };
    };
  };

  virtualisation.docker.daemon.settings = { data-root = "~/docker"; };
}
