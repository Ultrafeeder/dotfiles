{  pkgs, ... }:
let
	home-manager = fetchTarball{ 
url ="https://github.com/nix-community/home-manager/archive/master.tar.gz";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	(import "${home-manager}/nixos")
    ];
  nix.extraOptions = ''
  experimental-features = nix-command flakes
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "black_tower"; 
  # networking.wireless.enable = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = false;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    #media-session.enable = true;
  };


  users.users.ultrafeeder4 = {
    isNormalUser = true;
    description = "ultrafeeder4";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
	home-manager.users.ultrafeeder4 = {pkgs, ...}: {
		home.packages = with pkgs; [
			# utils
			cmake
      btop
			wl-clipboard
      wmenu
			manix
      gamescope
      wl-restart
      wlr-randr
      font-manager
      pamixer
      fnott
      fzf
      nerd-fonts.jetbrains-mono
      libgcc


      # apps
      orca-slicer
      openscad
      spotify
      discord
      freecad
      krita
      
      #lsps/languages
      typescript
      pyright
      typescript-language-server
      bash-language-server
      vscode-langservers-extracted
      ccls
      openscad-lsp

		];		
	programs = {
		    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Ultrafeeder4";
          email = "ultrafeeder4@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
    foot = {
      enable=true;
      settings = {
        main = {
          font = "JetBrainsMonoNL Nerd Font Mono:size=11";
        };
      };
    };
		neovim = {
			enable = true;
			viAlias = true;
      extraPackages = with pkgs; [
        bash-language-server
        ccls
        vscode-langservers-extracted
        lua-language-server
        typescript
        typescript-language-server
        pyright
      ];
		};
    };
  nixpkgs.config.allowUnfree = true;
	home.stateVersion = "25.11";
	};

  programs = {
    bash.enable = true;
    direnv = {
			enable = true;
			enableBashIntegration = true;
			nix-direnv.enable = true;
		};
   firefox.enable = true;
   steam.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = 
    (with pkgs; [
	    vim
      wayfire
      klassy
    ])
    ++
    (with pkgs.kdePackages; [
      krohnkite
    ]);

   # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
