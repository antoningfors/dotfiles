{ pkgs, config, libs, ... }:

{

# Enable OpenGL
  #hardware.opengl.enable = true;
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Whether to enable forcefully the full composition pipeline. This sometimes fixes screen tearing issues. This has been
    # reported to reduce the performance of some OpenGL applications and may produce issues in WebGL. It also drastically
    # increases the time the driver needs to clock down after load.
    # This option does not fully work on multiple screens instead use xserver.screenSection which probably should not be set here.
    #services.xserver.screenSection = ''Option "metamodes" "nvidia-auto-select {ForceFullCompositionPipeline=On}, nvidia-auto-select {ForceFullCompositionPipeline=On}"'';
    # forceFullCompositionPipeline = true;


    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      # Make sure to use the correct Bus ID values for your system!
      intelBusId = "PCI:00:02.0";
      nvidiaBusId = "PCI:01:00.0";
    };

  };

}
